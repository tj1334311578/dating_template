import 'package:dating_template/pages/message/qr_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

import '../../personalize/ui/theme.dart';
import '../community/page_view/like/mock.dart';
import 'firends_dialog.dart';

class PageViewMessage extends StatefulWidget {
  const PageViewMessage({Key? key}) : super(key: key);

  @override
  State<PageViewMessage> createState() => _PageViewMessageState();
}

class _PageViewMessageState extends State<PageViewMessage> {
  List<MockLike> lists = [];
  ScanController controller = ScanController();

  @override
  void initState() {
    super.initState();

    setState(() {
      lists = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Text('聊天'),
              actions: [
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.add,
                    size: WTheme.fsBase * 1.75,
                  ),
                  onSelected: (item) async {
                    if (item == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QrScan(),
                        ),
                      );
                    } else if (item == 2) {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) =>
                            const FirendsDialog(),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.crop_free),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: const Text('扫一扫'),
                          ),
                        ],
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.how_to_reg),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: const Text('添加好友'),
                          ),
                        ],
                      ),
                      value: 2,
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    search(),
                    Column(
                      children: lists
                          .map(
                            (e) => InkWell(
                              child: listCard(e),
                              onTap: () => Get.toNamed('/message/chat'),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listCard(MockLike item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(item.avatar),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              margin: const EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: .5,
                    color: WTheme.placeholder.withOpacity(.5),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.nickName,
                        style: TextStyle(
                          fontSize: WTheme.fsXl,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.time.split('T')[0],
                        style: TextStyle(
                            fontSize: WTheme.fsSm,
                            color: WTheme.secondary),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right: 24),
                            child: Text(
                              item.text,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: WTheme.secondary,
                                fontSize: WTheme.fsBase,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: WTheme.primary,
                          child: Text(
                            '${item.fav}',
                            style: TextStyle(fontSize: WTheme.fsSm),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container search() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: WTheme.bgColor,
        ),
        child: TextField(
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(fontSize: WTheme.fsBase),
          decoration: const InputDecoration(
            hintText: "请输入搜索关键词",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
