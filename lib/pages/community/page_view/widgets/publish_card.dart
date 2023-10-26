import 'package:flutter/material.dart';

import '../../../../personalize/kit/index.dart';
import '../../../../personalize/ui/tag.dart';
import '../../../../personalize/ui/theme.dart';
import '../like/mock.dart';

class PublishCard extends StatelessWidget {
  const PublishCard(this.item, {Key? key}) : super(key: key);

  final MockLike item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 4),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(44),
                child: WUtils.imageCache(item.avatar),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nickName,
                      style: TextStyle(
                        color: WTheme.base,
                        fontWeight: FontWeight.bold,
                        fontSize: WTheme.fsL,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.time,
                        style: TextStyle(
                          color: WTheme.secondary,
                        ),
                      ),
                    ),
                    buildMedia(item.mediaType, item.media),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        item.text,
                        style: TextStyle(
                          color: WTheme.base,
                          fontSize: WTheme.fsL,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Wrap(
                          spacing: 12,
                          runSpacing: 6,
                          children: item.tag.map((e) {
                            return Tag(
                              e,
                              borderRadius: BorderRadius.circular(24),
                              fontSize: WTheme.fsBase,
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              color: WTheme.primary,
                            );
                          }).toList()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 分享
                          iconText(Icons.offline_share, item.share.toString()),
                          Row(
                            children: [
                              // 关注
                              iconText(
                                Icons.favorite_border_outlined,
                                item.fav.toString(),
                              ),

                              // 评论
                              Container(
                                margin: const EdgeInsets.only(left: 24),
                                child: iconText(
                                  Icons.add_comment_outlined,
                                  item.comment.toString(),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  /// 显示多媒体
  Widget buildMedia(bool type, List<String> media) {
    if (media.isEmpty) {
      return Container();
    }

    if (type) {
      // 视频
      return Container(
        margin: const EdgeInsets.only(top: 8),
        width: 172,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(media[0]),
          ),
        ),
        child: Icon(
          Icons.play_circle_fill,
          color: WTheme.primary,
          size: WTheme.fsBase * 4,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: media
              .map((e) => SizedBox(
                    width: 124,
                    height: 124,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: WUtils.imageCache(e),
                    ),
                  ))
              .toList(),
        ),
      );
    }
  }

  Row iconText(IconData icondata, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icondata,
          color: WTheme.secondary,
          size: WTheme.fsXl,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            text,
            style: TextStyle(color: WTheme.secondary),
          ),
        )
      ],
    );
  }
}
