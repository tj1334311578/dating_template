import '../core/entity/base_entity.dart';
import '../dio_util.dart';

String _prefix = '/v1/tickets';

/// 新增工单
Future<BaseEntity> addTicketApi(Map data) => DioUtil.post(_prefix, data: data);

/// 获取指定工单信息
Future<BaseEntity> getTicketApi(num id) => DioUtil.get('$_prefix/$id');

/// 工单回复
Future<BaseEntity> ticketReply(Map data, num id) =>
    DioUtil.post('$_prefix/$id/item', data: data);

/// 工单列表
Future<BaseEntity> ticketListApi(Map<String, dynamic> params) =>
    DioUtil.get(_prefix, params: params);
