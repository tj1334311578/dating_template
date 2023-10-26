import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../constant/label_const.dart';
import '../../service/token.dart';

class ErrorToast {
  static void showErrorToast(int? errorCode, String? msg, bool showToast) {
    /// 统一处理部分重新登录问题
    if (errorCode == 6401) {
      /// 需要重新登录
      TokenController.to.delete();
    }
    if (!showToast) {
      return;
    }
    msg = msg ?? LabelConst.networkError.tr;

    ///toast吐司
    EasyLoading.showToast(msg, duration: const Duration(seconds: 1));
  }
}
