import 'package:dio/dio.dart';

class HttpError {
  ///HTTP 状态码
  ///未授权
  static const int unauthorized = 401;

  ///服务器拒绝请求
  static const int forbidden = 403;

  ///服务器找不到请求的网页。
  static const int notFound = 404;

  ///服务器等候请求时发生超时。
  static const int requestTimeout = 408;

  ///服务器遇到错误，无法完成请求。
  static const int internalServerError = 500;

  ///服务器作为网关或代理，从上游服务器收到无效响应。
  static const int badGateway = 502;

  ///服务器目前无法使用（由于超载或停机维护）。通常，这只是暂时状态。
  static const int serviceUnavailable = 503;

  ///服务器作为网关或代理，但是没有及时从上游服务器收到请求。
  static const int gatewayTimeout = 504;

  ///6200 成功码

  ///参数错误
  ///6400 （请求参数有误，统一提示用户：网络走丢了，客官请重试等等）提示语产品定
  static const int paramsError = 6400;

  ///6401 当前请求需要用户验证，鉴权失败，请重新登录
  static const int authenticationFailed = 6401;

  ///系统错误
  ///6500 （服务器上发生了一般错误，统一提示用户：网络走丢了，客官请重试等等）提示语产品定
  static const int servicesError = 6500;

  ///用户类6601-6699
  ///账号未绑定邮箱
  static const int unbindEmail = 6601;

  ///验证码输入错误，请重新输入
  static const int verifyError = 6602;

  ///密码长度为8-16位，必须包含大小写字母和数字 规则
  static const int pwdRuleError = 6603;

  ///两次密码输入不一致
  static const int pwdError = 6604;

  ///账号或密码输入错误
  static const int accountPwdError = 6605;

  ///账号或密码输入错误超过5次，限制登录
  static const int loginLimitError = 6606;

  ///用户名长度：8-16位数字+字母形式
  static const int accountError = 6607;

  ///该账号已被注册，请重新输入账号
  static const int accountRegisteredError = 6608;

  ///该邮箱已被注册，请切换账号
  static const int emailRegisteredError = 6609;

  ///当前账号未绑定邮箱
  static const int accountUnbindEmail = 6610;

  ///支付密码为6位数字
  static const int payPwdLimit = 6611;

  ///邮箱格式错误
  static const int mailboxFormatError = 6612;

  ///请重新获取验证码 1
  static const int verificationCodeAgainError = 6613;

  ///账号不存在
  static const int accountNotExistError = 6614;

  ///账号已锁定
  static const int accountLockedError = 6615;

  ///账号被禁止使用
  static const int accountProhibitedError = 6616;

  ///需要登录保护
  static const int requireLoginProtection = 6617;

  ///用户名长度：5-16位数字+字母形式
  static const int accountsError = 6618;

  ///用户名已存在
  static const int accountExistedError = 6619;

  ///当前密码不正确，请验证身份
  static const int pwdErrorVerifyIdentify = 6620;

  ///资金类6701-6799
  ///此收款地址不是ETH链下的，请重新输入地址
  static const int paymentAddressLimit = 6701;

  ///转账密码错误
  static const int transferPwdError = 6702;

  ///当前账号未绑定邮箱，无法转账
  static const int unbindEmailTransferError = 6703;

  ///当前账号未绑定邮箱，无法兑换
  static const int unbindEmailSwapError = 6704;

  ///交易类6801-6999

  ///自定义错误码 1100-1108
  ///未知错误
  static const int unknown = 1100;

  ///解析错误
  static const int parseError = 1101;

  ///网络错误
  static const int networkError = 1102;

  ///协议错误
  static const int httpError = 1103;

  ///证书错误
  static const int sslError = 1104;

  ///连接超时
  static const int connectTimeout = 1105;

  ///响应超时
  static const int receiveTimeout = 1106;

  ///发送超时
  static const int sendTimeout = 1107;

  ///网络请求取消
  static const int cancel = 1108;

  int? code;
  String? message;

  HttpError(this.code, this.message);

  HttpError.dioError(DioError error) {
    message = error.message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        code = connectTimeout;
        message = '网络连接超时，请检查网络设置(connectTimeout)';
        break;
      case DioErrorType.receiveTimeout:
        code = receiveTimeout;
        message = '服务器异常，请稍后重试(receiveTimeout)';
        break;
      case DioErrorType.sendTimeout:
        code = sendTimeout;
        message = '网络连接超时，请检查网络设置(sendTimeout)';
        break;
      case DioErrorType.response:
        code = httpError;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.cancel:
        code = cancel;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.other:
        code = unknown;
        message = "网络异常，请稍后重试！";
        break;
    }
  }

  @override
  String toString() {
    return 'HttpError{code:$code,message:$message}';
  }
}
