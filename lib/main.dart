import 'dart:io';

import 'package:dating_template/personalize/ui/theme.dart';
import 'package:dating_template/route.dart';
import 'package:dating_template/service/token.dart';
import 'package:dating_template/utils/overried_http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  /// 解决image.netWork异常问题 主要时cert问题
  HttpOverrides.global = OverrideHttpOverrides();
  Get.put(TokenController());
  runApp(const MyApp());
}

/// 个性化
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initialization();
  }

  void initialization() async {
    /// HACK: 启动页关闭
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '社区交友APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: WTheme.base,
            fontSize: WTheme.fsXl,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: IconThemeData(
            color: WTheme.base,
            size: WTheme.fsXl,
          ),
        ),
        primaryColor: WTheme.primary,
        backgroundColor: Colors.transparent,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: WTheme.fsBase),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        /// textButton 点击波纹
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            textStyle: MaterialStateProperty.all(
              TextStyle(color: WTheme.primary),
            ),
          ),
        ),

        /// 取消slider间距
        sliderTheme: SliderThemeData(
          trackHeight: 12,
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: WTheme.primary,
          inactiveTrackColor: WTheme.primary.withOpacity(.2),
          thumbColor: WTheme.primary,
          valueIndicatorColor: WTheme.primary,
          inactiveTickMarkColor: WTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: getRoutes,
      initialRoute: '/home',
      builder: EasyLoading.init(),
    );
  }
}
