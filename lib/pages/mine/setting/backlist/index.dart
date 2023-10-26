import 'package:flutter/material.dart';

import '../../../../personalize/kit/index.dart';
import '../../../../personalize/ui/theme.dart';

class SettingsBacklist extends StatefulWidget {
  const SettingsBacklist({Key? key}) : super(key: key);

  @override
  State<SettingsBacklist> createState() => _SettingsBacklistState();
}

class _SettingsBacklistState extends State<SettingsBacklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('黑名单'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (ctx, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .5,
                      color: WTheme.outline,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      margin: const EdgeInsets.only(right: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.network(WUtils.getRandomImage()),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '西瓜',
                                style: TextStyle(
                                  fontSize: WTheme.fsL,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '人生在世，及时行乐',
                                style: TextStyle(
                                  color: WTheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 76,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: WTheme.placeholder,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: const Text(
                              '移除',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
