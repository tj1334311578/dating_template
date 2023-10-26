import 'package:dating_template/pages/home/publish/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../personalize/ui/theme.dart';
import '../../service/token.dart';
import '../community/index.dart';
import '../message/index.dart';
import '../mine/index.dart';
import 'index/index.dart';

/// 首页 PageView Controller.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int curPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      if (TokenController.to.token.isEmpty) {
        Get.toNamed('/login/verify-code');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageViewIndex(),
          PageViewCommunity(),
          Publish(),
          PageViewMessage(),
          PageViewMine(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WTheme.primary,
        onPressed: () {
          // Get.toNamed('/publish');
          setState(() {
            curPage = 2;
            _pageController.jumpToPage(curPage);
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              barItem(curPage == 0, 0, icon: Icons.home_filled, text: "首页"),
              barItem(curPage == 1, 1, icon: Icons.access_alarm, text: "广场"),
              const SizedBox(
                width: 48,
              ),
              barItem(curPage == 3, 3, icon: Icons.message_sharp, text: "消息"),
              barItem(curPage == 4, 4, icon: Icons.person, text: "我的"),
            ],
          ),
        ),
      ),
    );
  }

  IconButton barItem(
    bool active,
    int initPage, {
    required IconData icon,
    required String text,
  }) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      color: active ? WTheme.primary : WTheme.secondary,
      icon: Column(
        children: [
          Icon(icon),
          Text(
            text,
            style: TextStyle(
              color: active ? WTheme.primary : WTheme.secondary,
            ),
          ),
        ],
      ),
      onPressed: () {
        setState(() {
          curPage = initPage;
          _pageController.jumpToPage(curPage);
        });
      },
    );
  }
}
