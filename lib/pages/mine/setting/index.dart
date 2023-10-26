import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../personalize/ui/cell.dart';
import '../../../personalize/ui/theme.dart';

/// HACK: 设置

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Cell(
                '账号安全',
                onTap: () => Get.toNamed('/settings/account'),
              ),
              Cell(
                '消息通知',
                onTap: () => Get.toNamed('/settings/notification'),
              ),
              Cell(
                '隐私设置',
                onTap: () => Get.toNamed('/settings/privacy'),
              ),
              Cell(
                '清除缓存',
                right: Text(
                  '190M',
                  style: TextStyle(fontSize: WTheme.fsL),
                ),
                onTap: () => bottomConfirm(context),
              ),
              Cell('关于我们', onTap: () => Get.toNamed('/settings/about')),
              Cell(
                '退出登录',
                border: false,
                onTap: () => Get.offAndToNamed('/login/verify-code'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> bottomConfirm(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      '清除所有缓存记录',
                      style: TextStyle(
                        color: WTheme.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 12),
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              width: 1,
                              color: WTheme.outline,
                            ),
                          ),
                        ),
                        child: Text(
                          '清除缓存',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: WTheme.fsXl,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '取消',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: WTheme.fsXl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
