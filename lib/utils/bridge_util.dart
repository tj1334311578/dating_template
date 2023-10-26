import 'package:flutter/services.dart';

import 'log_util.dart';

class BridgeUtil {
  static const _android = MethodChannel('toAndroid');

  static Future<String?> invokeAndroidPay({dynamic requestMsg}) async {
    var result;
    try {
      result = await _android.invokeMethod('pay');
    } catch (_) {}
    LogUtil.v('result:$result');
    return result;
  }
  
static MethodChannel logChannel=MethodChannel('LogChannel');

}
