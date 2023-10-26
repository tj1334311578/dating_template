import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';

import 'log_util.dart';

class DeviceUtil {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOs);

  static bool get isMobile => isAndroid || isIOS;

  static bool get isWeb => kIsWeb;

  static bool get isWindows =>
      (defaultTargetPlatform == TargetPlatform.windows);

  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  static bool get isMacOs => defaultTargetPlatform == TargetPlatform.macOS;

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  static bool get isFuchsia => defaultTargetPlatform == TargetPlatform.fuchsia;

  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static DeviceInfoPlugin? deviceInfo;
  static IosDeviceInfo? iosInfo;
  static AndroidDeviceInfo? androidInfo;
  static WebBrowserInfo? webBrowserInfo;
  static LinuxDeviceInfo? linuxDeviceInfo;
  static WindowsDeviceInfo? windowsDeviceInfo;
  static BaseDeviceInfo? commonDeviceInfo;

  static String? deviceId;

  /// 初始化 获取设备信息
  static Future<void> initPlatformState() async {
    /// 單獨獲取deviceId吧
    handelDeviceId();
    LogUtil.v("object   初始化    设备信息 $deviceId");
    deviceInfo = deviceInfo ?? DeviceInfoPlugin();
    if (isAndroid) {
      androidInfo = await deviceInfo?.androidInfo;
      commonDeviceInfo = androidInfo;
    }
    if (isIOS) {
      iosInfo = await deviceInfo?.iosInfo;
      commonDeviceInfo = iosInfo;
    }
    if (isWeb) {
      webBrowserInfo = await deviceInfo?.webBrowserInfo;
      commonDeviceInfo = webBrowserInfo;
    }
    if (isLinux) {
      linuxDeviceInfo = await deviceInfo?.linuxInfo;
      commonDeviceInfo = linuxDeviceInfo;
    }
    if (isWindows) {
      try {
        windowsDeviceInfo = await deviceInfo?.windowsInfo;
        commonDeviceInfo = windowsDeviceInfo;
      } catch (e) {
        LogUtil.e(e);
      }
    }
    if (isMacOs) {
      commonDeviceInfo = await deviceInfo?.macOsInfo;
    }
    LogUtil.v(
        '初始化成功:\nandroid:${androidInfo?.toMap()} \nios:${iosInfo?.toMap()} \ncommonInfo:${commonDeviceInfo?.toMap()}');
  }

  static void handelDeviceId() async {
      deviceId = await PlatformDeviceId.getDeviceId;
    LogUtil.v('deviceid 2===>:$deviceId');
  }
}
