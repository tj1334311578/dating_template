import 'package:dating_template/service/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class EnsureAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (TokenController.to.token.isEmpty) {
      return RouteSettings(name: Routes.loginThen(route ?? '/home'));
    }
    return super.redirect(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (TokenController.to.token.isNotEmpty) {
      return null;
    }
    return await super.redirectDelegate(route);
  }
}
abstract class Routes{
  Routes._();
  static String loginThen(String afterSuccessfulLogin) =>
      '/login/verify-code?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

