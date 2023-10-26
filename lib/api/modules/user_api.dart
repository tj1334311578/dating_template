
import '../core/entity/base_entity.dart';
import '../dio_util.dart';

String _prefix = '/v1/users';

/// 登录  post params[account,password]
Future<BaseEntity> loginApi(Map data, {bool showLoading = false}) =>
    DioUtil.post('$_prefix/auth', data: data, showLoading: showLoading);

/// 注册 post params[register_type,account,password,repeat_password ]
Future<BaseEntity> registerApi(Map data) =>
    DioUtil.post('$_prefix/signup', data: data, showLoading: true);

/// 登出
Future<BaseEntity> loginOutApi() => DioUtil.put('$_prefix/logout');

/// 重置密码 post params[id,password,access_key]
Future<BaseEntity> resetPwdApi(Map data) =>
    DioUtil.put('$_prefix/password/reset', data: data, showToast: true);

/// 获取自身信息
Future<BaseEntity> userInfoApi() => DioUtil.get('$_prefix/me');

/// 修改密码
Future<BaseEntity> changePwdApi(Map data) =>
    DioUtil.put('$_prefix/password/change', data: data);

/// 根据名称或邮箱获取用户id
Future<BaseEntity> getUserIdApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/id', params: params);

/// 设置密保
Future<BaseEntity> securityQuestionApi(List data) =>
    DioUtil.put('$_prefix/id/security_question', data: data);

/// 获取密保
Future<BaseEntity> getSecurityApi(num id) =>
    DioUtil.get('$_prefix/$id/security_question');

/// 验证密保
Future<BaseEntity> verifySecurityApi(List data, num id) =>
    DioUtil.post('$_prefix/$id/security_question/verify', data: data);

/// 修改邮箱
Future<BaseEntity> modifyEmailApi(Map data) =>
    DioUtil.put('$_prefix/email', data: data);

/// 心跳
Future<BaseEntity> heartApp(Map data) => DioUtil.post('$_prefix/heart',data: data);
