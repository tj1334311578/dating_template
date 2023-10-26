import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../personalize/kit/index.dart';
import '../../../../personalize/ui/theme.dart';

/// HACK: 设置新密码

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 26),
          margin: const EdgeInsets.only(bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '设置新密码',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: WTheme.base,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  '密码至少8位，包含数字/字母/字符组合',
                  style: TextStyle(color: WTheme.secondary),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 36),
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "请输入新密码",
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: WTheme.outline,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: WTheme.primaryFocus,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await WUtils.toast('密码重置成功！');
                  Get.offAllNamed('/login/password');
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 36),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: WTheme.radius,
                    color: WTheme.primary,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '确认',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
