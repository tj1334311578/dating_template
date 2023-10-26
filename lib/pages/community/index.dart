import 'package:dating_template/pages/community/page_view/recommend/index.dart';
import 'package:flutter/material.dart';

import '../../personalize/ui/theme.dart';
import 'page_view/found/index.dart';
import 'page_view/like/index.dart';

/// HACK: 社区

class PageViewCommunity extends StatefulWidget {
  const PageViewCommunity({Key? key}) : super(key: key);

  @override
  State<PageViewCommunity> createState() => _PageViewCommunityState();
}

class _PageViewCommunityState extends State<PageViewCommunity>
    with TickerProviderStateMixin {
  int curPage = 0;

  final List<Tab> _tabs = const [
    Tab(text: "关注"),
    Tab(text: "推荐"),
    Tab(text: "发现"),
  ];

  late PageController _pageController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
    _pageController = PageController(initialPage: curPage);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: curPage,
      length: _tabs.length,
      child: Column(
        children: [
          setAppbar(),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                PageViewLike(),
                PageViewRecommend(),
                PageViewFound()
              ],
            ),
          )
        ],
      ),
    );
  }

  /// appbar
  AppBar setAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: TabBar(
        controller: _tabController,
        indicatorColor: WTheme.primary,
        unselectedLabelColor: WTheme.secondary,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        labelColor: WTheme.base,
        labelStyle: TextStyle(
          fontSize: WTheme.fsXl,
          fontWeight: FontWeight.bold,
        ),
        indicatorWeight: 4,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 24),
        tabs: _tabs,
        onTap: (int page) {
          setState(() {
            curPage = page;
            _pageController.jumpToPage(curPage);
          });
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.email_outlined,
            size: WTheme.fsXl * 1.5,
            color: WTheme.base.withOpacity(.75),
          ),
        )
      ],
    );
  }
}
