
import '../core/entity/base_entity.dart';
import '../dio_util.dart';

String _prefix = '/v1';

/// 升级版本信息
Future<BaseEntity> getVersionApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/app/version/last', params: params);

/// 获取渠道
Future<BaseEntity> getChannel(String id) =>
    DioUtil.get('$_prefix/channels/{id}');

/// 拉取配置
Future<BaseEntity> getConfigApi(bool showLoading) =>
    DioUtil.get('$_prefix/conf/base', showLoading: showLoading);

/// 常见问题
Future<BaseEntity> questListApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/faq', params: params, showLoading: false);

/// 获取问题分类
Future<BaseEntity> questionClassifyApi() =>
    DioUtil.get('$_prefix/faq/group/category');

/// 崩溃上报
Future<BaseEntity> crashReportApi(Map data) =>
    DioUtil.post('$_prefix/crash_log', data: data);

/// 获取当前账号消息提醒
Future<BaseEntity> accountNotice() => DioUtil.get('$_prefix/attach/notice');
