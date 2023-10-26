import 'package:dating_template/pages/agreement/privacy.dart';
import 'package:dating_template/pages/agreement/user.dart';
import 'package:dating_template/pages/history_match/index.dart';
import 'package:dating_template/pages/home/home.dart';
import 'package:dating_template/pages/home/publish/index.dart';
import 'package:dating_template/pages/login/password.dart';
import 'package:dating_template/pages/login/verify_code.dart';
import 'package:dating_template/pages/message/chat/index.dart';
import 'package:dating_template/pages/mine/add_tag/index.dart';
import 'package:dating_template/pages/mine/fans/index.dart';
import 'package:dating_template/pages/mine/firends/index.dart';
import 'package:dating_template/pages/mine/setting/about/index.dart';
import 'package:dating_template/pages/mine/setting/account/index.dart';
import 'package:dating_template/pages/mine/setting/account/logout.dart';
import 'package:dating_template/pages/mine/setting/account/update_phone.dart';
import 'package:dating_template/pages/mine/setting/account/update_phone2.dart';
import 'package:dating_template/pages/mine/setting/backlist/index.dart';
import 'package:dating_template/pages/mine/setting/index.dart';
import 'package:dating_template/pages/mine/setting/notification/index.dart';
import 'package:dating_template/pages/mine/setting/password/reset.dart';
import 'package:dating_template/pages/mine/setting/password/update.dart';
import 'package:dating_template/pages/mine/setting/privacy/index.dart';
import 'package:dating_template/pages/mine/visitors/index.dart';
import 'package:dating_template/pages/verify_code/index.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getRoutes = [
  GetPage(name: '/home', page: () => const Home()),
  GetPage(name: '/login/verify-code', page: () => const LoginVerifyCode()),
  GetPage(name: '/login/password', page: () => const LoginPassword()),
  GetPage(name: '/verify-code/:type', page: () => const VerifyCode()),
  GetPage(name: '/password/reset', page: () => const PasswordReset()),
  GetPage(name: '/password/update', page: () => const PasswordUpdate()),
  GetPage(name: '/agreement/user', page: () => const AgreementUser()),
  GetPage(name: '/agreement/privacy', page: () => const AgreementPrivacy()),
  GetPage(name: '/history-match', page: () => const HistoryMatch()),
  GetPage(name: '/settings', page: () => const Settings()),
  GetPage(name: '/settings/account', page: () => const SettingsAccount()),
  GetPage(
      name: '/settings/account/update-phone',
      page: () => const AccountUpdatePhone()),
  GetPage(
      name: '/settings/account/update-phone2',
      page: () => const AccountUpdatePhone2()),
  GetPage(name: '/settings/account/logout', page: () => const AccountLogout()),
  GetPage(
      name: '/settings/notification', page: () => const SettingsNotification()),
  GetPage(name: '/settings/privacy', page: () => const SettingsPrivacy()),
  GetPage(name: '/settings/backlist', page: () => const SettingsBacklist()),
  GetPage(name: '/settings/about', page: () => const SettingsAbout()),
  GetPage(name: "/mine/add-tag", page: () => const MineAddTag()),
  GetPage(name: "/mine/visitors", page: () => const MineVisitors()),
  GetPage(name: "/mine/firends", page: () => const MineFirends()),
  GetPage(name: "/mine/fans", page: () => const MineFans()),
  GetPage(name: "/message/chat", page: () => const MessageChat()),
  GetPage(name: "/publish", page: () => const Publish()),
];
