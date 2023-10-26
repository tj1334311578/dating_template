import 'package:dating_template/service/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../constant/app_config.dart';
import '../../../utils/device_util.dart';
import '../../../utils/log_util.dart';
import '../api_const.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    /// 系统语言
    Locale locale = WidgetsBinding.instance.window.locale;

    /// 语言
    // String language = (AuthService.to.getActiveAccount()?.language ??
    //     '${locale.languageCode}_${locale.countryCode}')
    //     .replaceAll("_", "-");

    /// 下载应用，设置请求头，获取contentLength  “Accept-Encoding", "identity"
    if (DeviceUtil.isWeb) {
      String version = '1.0.0';
      String dev = 'Web';
      options.headers[ApiConst.deviceVersion] = version;
      options.headers[ApiConst.deviceModel] = dev;
      // options.headers[ApiConst.lang] = language;
    } else if (DeviceUtil.isDesktop) {
      String version = '1.0.0';
      String dev = DeviceUtil.isWindows
          ? 'windows'
          : DeviceUtil.isMacOs
              ? 'macos'
              : DeviceUtil.isLinux
                  ? 'linux'
                  : 'desktop';
      options.headers[ApiConst.deviceVersion] = version;
      options.headers[ApiConst.deviceModel] = dev;
      var id = DeviceUtil.deviceId?.replaceAll("-", "").trim();

      /// W-Device-ID
      options.headers[ApiConst.deviceId] = id;
      options.headers[ApiConst.source] = "windows-app";
      LogUtil.v('devicesID:$id');
      // options.headers[ApiConst.lang] = language;
    } else {
      /// 版本信息
      String? version;
      String? id;
      String? model;
      String? fingerprint;
      if (DeviceUtil.isAndroid) {
        version = DeviceUtil.androidInfo?.brand;
        id = DeviceUtil.androidInfo?.id;
        model = DeviceUtil.androidInfo?.model;
        fingerprint = DeviceUtil.androidInfo?.fingerprint;
      } else if (DeviceUtil.isIOS) {
        /// IOS数据未设置
        version = DeviceUtil.iosInfo?.systemVersion.toString();
        id = DeviceUtil.iosInfo?.identifierForVendor;
        model = DeviceUtil.iosInfo?.model;
      }

      /// 设备系统
      String os = 'iphone';

      /// W-Source
      String source = DeviceUtil.isAndroid
          ? 'android-app'
          : (DeviceUtil.isIOS ? 'ios-app' : 'other');

      /// 登录设备系统
      options.headers[ApiConst.deviceOs] = os;

      /// W-Device-ID
      options.headers[ApiConst.deviceId] = DeviceUtil.deviceId;
      options.headers[ApiConst.deviceVersion] = version;
      options.headers[ApiConst.deviceModel] = model;
      // options.headers[ApiConst.lang] = language;
      options.headers[ApiConst.source] = source;
    }
    options.headers[ApiConst.channelId] = Constant.channelId;
    LogUtil.v(options.toString());

    /// 登录了就加token
    if (TokenController.to.token.isNotEmpty) {
      options.headers[ApiConst.auth] =TokenController.to.token;
    }
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }
}
