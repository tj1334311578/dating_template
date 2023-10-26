import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as gets;

import '../../constant/app_config.dart';
import '../constant/label_const.dart';
import '../utils/log_util.dart';
import 'core/api_const.dart';
import 'core/dio_method.dart';
import 'core/entity/base_entity.dart';
import 'core/error_toast.dart';
import 'core/http_error.dart';
import 'core/interceptor/auth_interceptor.dart';

class DioUtil {
  static const String _tag = 'DioUtil';

  ///单列模式
  ///在dart 中，带下划线的变量为私有变量
  static DioUtil? _instance;

  static DioUtil? getInstance() {
    _instance ??= DioUtil();
    return _instance;
  }

  Dio dio = Dio();
  DioUtil() {
    /// 添加dio cert报错异常
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=(HttpClient client){
      client.badCertificateCallback=(X509Certificate cert,String host,int port)=>true;
      return client;
    };
    dio.options.contentType =
        ContentType.parse('application/json;charset=UTF-8').toString();
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(AuthInterceptor());
  }

  static Map<String, dynamic> _parseData(String data) {
    return json.decode(data) as Map<String, dynamic>;
  }

  static Future<BaseEntity<T>> _request<T>(String url, DioMethod method,
      {Map<String, dynamic>? params,
      dynamic data,
      bool showLoading = false,
      bool showToast = false,
      String? loadingText,
      CancelToken? cancelToken}) async {
    var http = DioUtil.getInstance()!.dio;
    http.options.baseUrl = ApiConst.baseUrl;
    Response? response;
    if (showLoading) {
      EasyLoading.show(
        status: loadingText ?? LabelConst.loading.tr,
        maskType: EasyLoadingMaskType.black,
      );
    }
    try {
      //更新日志
      switch (method) {
        case DioMethod.get:
          if (params != null) {
            response = await http.get(
              url,
              queryParameters: params,
              cancelToken: cancelToken,
            );
            break;
          }
          response = await http.get(
            url,
            cancelToken: cancelToken,
          );
          break;
        case DioMethod.post:
          if (params != null && params.isNotEmpty) {
            response = await http.post(
              url,
              queryParameters: params,
              data: data,
              cancelToken: cancelToken,
            );
            break;
          }
          response = await http.post(url, data: data, cancelToken: cancelToken);
          break;
        case DioMethod.put:
          if (params != null && params.isNotEmpty) {
            response = await http.post(
              url,
              queryParameters: params,
              data: data,
              cancelToken: cancelToken,
            );
            break;
          }
          response = await http.put(url, data: data, cancelToken: cancelToken);
          break;
        default:
      }

      /// debug 模式打印数据
      LogUtil.v('请求url：$url', tag: _tag);
      if (params != null) {
        LogUtil.v('请求参数：${params.toString()}', tag: _tag);
      }
      if (response != null) {}
    } on DioError catch (e, s) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      LogUtil.e('请求异常：$e\n$s\n$url', tag: _tag);
      var response = e.response?.data;
      if (response != null && response['msg'] != null) {
        return BaseEntity<T>.fromJson({
          ApiConst.errno: response['code'],
          ApiConst.message: response['msg'],
        });
      }
      HttpError httpError = HttpError.dioError(e);
      ErrorToast.showErrorToast(httpError.code, httpError.message, showToast);
      return BaseEntity<T>.fromJson({
        ApiConst.errno: httpError.code,
        ApiConst.message: httpError.message,
      });

      ///  根据错误信息提示
    } catch (e, s) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      LogUtil.e('未知异常:$e\n$s', tag: _tag);
      var entity = BaseEntity<T>.fromJson({
        ApiConst.errno: ApiConst.errnoUnknown,
        ApiConst.message: ApiConst.errnoUnknownMessage
      });
      //  根据错误信息提示
      ErrorToast.showErrorToast(entity.code, entity.msg, showToast);
      return entity;
    }

    try {
      String jsonString = json.encode(response?.data);

      /// 集成测试无法使用 isolate https://github.com/flutter/flutter/issues/24703
      /// 使用compute条件：数据大于10KB（粗略使用10 * 1024）且当前不是集成测试（后面可能会根据Web环境进行调整）
      /// 主要目的减少不必要的性能开销
      ///
      final bool isCompute =
          !Constant.isDriverTest && jsonString.length > 10 * 1024;
      final Map<String, dynamic> dataMap = isCompute
          ? await compute(_parseData, jsonString)
          : _parseData(jsonString);

      if (showLoading) {
        EasyLoading.dismiss();
      }
      var entity = BaseEntity<T>.fromJson(dataMap);
      // if (entity.code == 6402) {
      //   EasyLoading.showToast(entity.msg ?? "");
      //   AuthService.to.logout(jumpLogin: false);
      //   var result = await gets.Get.offAndToNamed(Routes.login);
      //
      //   /// 重新请求登录
      //   if (result == true) {
      //     return _request(url, method,
      //         params: params,
      //         data: data,
      //         showLoading: showLoading,
      //         showToast: showToast,
      //         cancelToken: cancelToken);
      //   }
      // }
      /// 需要登录验证
      // if (entity.code == HttpError.requireLoginProtection) {
      //   LogUtil.v('跳到登录验证');
      //   data['email'] = entity.data;
      //   var result =
      //   await gets.Get.toNamed(Routes.loginVerify, arguments: data);
      //   LogUtil.v('result $result');
      //
      //   /// 重新请求登录
      //   if (result == true) {
      //     return _request(url, method,
      //         params: params,
      //         data: data,
      //         showLoading: showLoading,
      //         showToast: showToast,
      //         cancelToken: cancelToken);
      //   }
      // }
      List<int> ignore = [
        5523,
        6617,
        ApiConst.errnoOk,
        HttpError.requireLoginProtection
      ];
      ErrorToast.showErrorToast(
          entity.code, entity.msg, showToast && !ignore.contains(entity.code));
      return entity;
    } catch (e) {
      if (showLoading) {
        EasyLoading.dismiss();
      }
      LogUtil.e('数据解析错误：$e\n', tag: _tag);
      var entity = BaseEntity<T>.fromJson({
        ApiConst.errno: ApiConst.errnoUnknown,
        ApiConst.message: ApiConst.errnoUnknownMessage
      });
      ErrorToast.showErrorToast(entity.code, entity.msg, showToast);
      return entity;
    }
  }

  static Future<BaseEntity<T>> get<T>(
    String url, {
    Map<String, dynamic>? params,
    bool showLoading = false,
    bool showToast = false,
    String loadingText = "",
    CancelToken? cancelToken,
  }) {
    return _request(url, DioMethod.get,
        params: params,
        showLoading: showLoading,
        loadingText: loadingText,
        showToast: showToast,
        cancelToken: cancelToken);
  }

  static Future<BaseEntity<T>> post<T>(
    String url, {
    Map<String, dynamic>? params,
    dynamic data,
    bool showLoading = false,
    bool showToast = false,
    String? loadingText,
    CancelToken? cancelToken,
  }) {
    return _request(url, DioMethod.post,
        data: data,
        params: params,
        showLoading: showLoading,
        showToast: showToast,
        loadingText: loadingText,
        cancelToken: cancelToken);
  }

  static Future<BaseEntity<T>> put<T>(
    String url, {
    Map<String, dynamic>? params,
    dynamic data,
    bool showLoading = false,
    bool showToast = false,
    String? loadingText,
    CancelToken? cancelToken,
  }) {
    return _request(url, DioMethod.put,
        data: data,
        params: params,
        showLoading: showLoading,
        showToast: showToast,
        loadingText: loadingText,
        cancelToken: cancelToken);
  }
}
