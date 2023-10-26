// ignore_for_file: constant_identifier_names

import 'http_error.dart';

class ApiConst {
  static const String errno = 'code';
  static const String message = 'msg';
  static const int errnoOk = 2000;
  static const String ERRNO_DIO_ERROR = "dioError";
  static const int errnoUnknown = HttpError.unknown;
  static const String errnoUnknownMessage = "UNKNOWN MESSAGE";
  static const int ERRNO_FORBIDDEN = HttpError.forbidden;
  static const String ERRNO_NOT_SET_PASSWORD = "30021";

  ///设备品牌版本 (IOS15)
  static const String deviceVersion = "W-Device-Version";

  ///设备型号 (iphone13)
  static const String deviceModel = "W-Device-Model";

  ///客户端唯一设备号
  static const String deviceId = "W-Device-ID";

  ///登录设备系统(chrome，MAC，iphone)
  static const String deviceOs = "W-Device-OS";

  ///客户端语言
  static const String lang = "W-Lang";

  ///来源，web，android-app，ios-app

  static const String source = "W-Source";

  /// authorization
  static const String auth = "Authorization";

  /// channel-Id
  static const String channelId = "Channel-ID";

  /// 开发
  // static const String baseUrl = 'http://192.168.2.205:30081';

  /// 外网开发环境
// static const String baseUrl = 'https://api-test-dadwadadadad.arbaby.me';

  /// 测试
  // static const String baseUrl = 'http://192.168.2.249:30084';

  // static const String baseUrl = 'http://192.168.2.179:8082';
  static String baseUrl = 'http://192.168.2.179:10004';


  /// 生产环境
// static const String baseUrl = 'https://api.koudaiwallet.com';
}
