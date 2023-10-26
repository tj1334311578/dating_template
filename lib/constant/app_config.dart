import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:get/utils.dart';

class AppConfig {
  static EnvModel env = EnvModel(envMode: EnvEnum.test); //环境变量配置，默认配置

  /// 节点刷新间隔时间
  static Duration nodeListRefreshDuration = 30.seconds;

  /// 节点列表定时刷新是否启用
  static const bool nodeListRefreshIsEnable = true;
}

enum EnvEnum {
  test,
  prod,
}

class EnvModel {
  EnvEnum envMode;

  EnvModel({
    required this.envMode,
  });
}

class Constant {
  static const bool isReleaseMode = kReleaseMode;

  //是否测试模式-debug
  static const bool isDriverTest = !isReleaseMode;

  //语言列表
  static const languages = ["简体中文", "English", "한국어", "日本語"];

  //对应的local
  static const locals = [
    /// 中文
    Locale('zh-CN'),

    /// 英语(美国)
    Locale('en-US'),

    /// 韩文
    Locale('ko-KR'),

    /// 日文
    Locale('ja-JP'),
  ];

  //对应的版本名
  static String version = "1.0.0";

  //对应的版本号
  static int versionCode = 1;

  // channel_id
  static int channelId = 453448073449541;

  static String name = '';

  /// 代理端口
  static int proxyPort = 5556;

  /// 域名解析端口  注：本地解析必须用53端口；否则连接节点失败
  static int dnsPort = 53;
}
