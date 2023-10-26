import '../core/entity/base_entity.dart';
import '../dio_util.dart';

String _prefix = '/v1/tactic/ad';

/// 获取用户广告
Future<BaseEntity> getUserAdvApi() => DioUtil.get('$_prefix/match');

/// 触发广告浏览
Future<BaseEntity> browserAdvApi(Map data) =>
    DioUtil.post('$_prefix/view', data: data);

/// 触发广告奖励
Future<BaseEntity> rewardAdvApi(Map data) =>
    DioUtil.post('$_prefix/award', data: data);

/// 设置广告转化
Future<BaseEntity> transAdvApi(Map data) =>
    DioUtil.put('$_prefix/trans', data: data);

/// 获取奖励列表
Future<BaseEntity> rewardListApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/award', params: params);

/// 领取奖励
Future<BaseEntity> receiveRewardApi(Map data) =>
    DioUtil.post('$_prefix/award/receive', data: data);

/// 广告不通过代理
Future<BaseEntity> passDnsApi() => DioUtil.get('$_prefix/dns');
