import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/assets_constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/models/comment/comment_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailCommentCard extends HookConsumerWidget {
  final CommentModel comment;
  final PageModel page;
  const DetailCommentCard({
    required this.comment,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1 익명 0 실명
    // 익명이면 프로필 타고 들어갈 수도 없음.
    final userStatus = useState(1);
    final userInfo = ref.watch(userInfoProvier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // 그 사람의 프로필 탭으로 이동.
                    // 프로필 탭은 항상 유저의 seq 를 필요로 할 것.
                    ref.read(bottomNavProvier.notifier).onChange(3);
                    context.push('/');
                  },
                  child:
                      comment.users!.photo == '' || comment.users!.photo == null
                          ? SvgPicture.asset(
                              AssetsConstants.noImg,
                              width: 35.w,
                              height: 35.w,
                              fit: BoxFit.cover,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'http://topping.io:8855${comment.users!.photo}',
                                placeholder: (context, text) {
                                  return SvgPicture.asset(
                                    AssetsConstants.noImg,
                                  );
                                },
                                width: 35.w,
                                height: 35.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 익명이 아닐 경우 이동 가능.
                        if (userStatus.value != 1) {
                          ref.read(bottomNavProvier.notifier).onChange(3);
                          context.push('/');
                        }
                      },
                      child: Text(
                        comment.users!.nickname.toString(),
                        style: AppTextStyle.boldTextStyle,
                      ),
                    ),
                    Text(
                      comment.comment!.remaining.toString(),
                      style: AppTextStyle.hintStyle.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // context.push('/community_ask', extra: {
                //   'page': page,
                //   'type': 'default',
                //   'commentIndex': 0
                // });
                final myData =
                    userInfo!.userInfo!.seq == comment.users!.seq ? 1 : 0;

                commentMore(
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
        Container(
          margin: EdgeInsets.only(left: 45.w),
          child: Text(
            comment.comment!.reply.toString(),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
