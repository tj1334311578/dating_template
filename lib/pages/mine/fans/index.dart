import 'package:flutter/material.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

import '../../../personalize/ui/theme.dart';
import '../../community/page_view/like/mock.dart';

class MineFans extends StatefulWidget {
  const MineFans({Key? key}) : super(key: key);

  @override
  State<MineFans> createState() => _MineFansState();
}

class _MineFansState extends State<MineFans> {
  List<MockLike> lists = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      lists = MockLike.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('粉丝'),
      ),
      body: SafeArea(
        child: ListView(
          children: lists.map((e) => listCard(e)).toList(),
        ),
      ),
    );
  }
}

Container listCard(MockLike item) {
  bool fav = mock.boolean();

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
            padding: const EdgeInsets.only(left: 12),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.nickName,
                      style: TextStyle(
                        fontSize: WTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${mock.integer(min: 1, max: 99)}天 | ${mock.integer(min: 1, max: 99)}动态',
                        style: TextStyle(
                          color: WTheme.secondary,
                          fontSize: WTheme.fsBase,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: fav ? WTheme.placeholder : WTheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      fav ? '已关注' : '关注',
                      style: TextStyle(
                          fontSize: WTheme.fsSm, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
