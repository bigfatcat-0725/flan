import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/core/util.dart';
import 'package:flan/models/comment/comment_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WrittenCommentCard extends HookConsumerWidget {
  final CommentModel comment;
  final int page;
  const WrittenCommentCard({
    required this.comment,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> contentImgList =
        (comment.comment!.photo != null && comment.comment!.photo != "")
            ? comment.comment!.photo.toString().split(',')
            : [];

    return GestureDetector(
      onTap: () {
        context.push('/written_detail', extra: {'page': page});
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: 35.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.5,
              color: Color(0xffcccccc),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    comment.comment!.reply.toString(),
                  ),
                ),
                SizedBox(width: 10.w),
                Row(
                  children: [
                    Text(
                      comment.comment!.remaining.toString(),
                      style: AppTextStyle.hintStyle.copyWith(fontSize: 11.sp),
                    ),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        final myData = 1;

                        commentWrittenDrawer(
                          context,
                          page: page,
                          comment: comment,
                          myData: myData,
                          ref: ref,
                        );
                      },
                      child: Icon(
                        Icons.more_horiz,
                        size: 20.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    contentImgList.length,
                    (index) => GestureDetector(
                          onTap: () {
                            context.push('/photo', extra: {
                              'img':
                                  'http://topping.io:8855${contentImgList[index]}'
                            });
                          },
                          child: Container(
                            width: 200.w,
                            height: 140.h,
                            margin: EdgeInsets.only(
                              bottom: 10.h,
                              // 어차피 한장.
                              right:
                                  contentImgList[contentImgList.length - 1] ==
                                          contentImgList[index]
                                      ? 0.w
                                      : 10.w,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'http://topping.io:8855${contentImgList[index]}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
