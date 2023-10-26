
import '../core/entity/base_entity.dart';
import '../dio_util.dart';

String _prefix = "/v1";

/// 获取公告
Future<BaseEntity> announcementListApi() =>
    DioUtil.get('$_prefix/announce/backend/effecting');

/// 获取指定消息
Future<BaseEntity> getMsgApi(num id) => DioUtil.get('$_prefix/msg/$id');

/// 获取消息列表
Future<BaseEntity> msgListApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/msg', params: params);

/// 获取分组列表
Future<BaseEntity> nodeGroupListApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/node_group', params: params);

/// 获取分组与节点列表
Future<BaseEntity> nodeListApi(Map<String, dynamic> params) =>
    DioUtil.get('$_prefix/node', params: params);

/// 连接节点
Future<BaseEntity> connectNodeApi(num id) =>
    DioUtil.post('$_prefix/node/$id/connect');

/// 获取官网生效公告
Future<BaseEntity> effectAnnouncement() =>
    DioUtil.get('$_prefix/announce/official_web/effecting');

/// 获取密保问题列表
Future<BaseEntity> getSecurityList() =>
    DioUtil.get('$_prefix/security_question');
