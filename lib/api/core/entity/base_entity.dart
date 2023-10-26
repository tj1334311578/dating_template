import '../../../utils/object_util.dart';
import '../api_const.dart';
import 'entry_factory.dart';

class BaseEntity<T> {
  int? code;
  String? msg;
  T? data;

  BaseEntity({this.code, this.msg, this.data});

  BaseEntity.fromJson(Map<String, dynamic> jsonMap) {
    code = jsonMap[ApiConst.errno] as int?;
    msg = jsonMap[ApiConst.message] as String?;
    if (jsonMap.containsKey('data') && !ObjectUtil.isEmpty(jsonMap['data'])) {
      data = EntityFactory.generateOBJ<T>(jsonMap['data']);
    }
  }
}
