import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCardNew extends HookConsumerWidget {
  final Question data;
  final int isMyData;
  const ProfileCardNew({
    super.key,
    required this.data,
    required this.isMyData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;

    // data 정리
    final String private = data.questions!.private as String;
    final String questionName = data.users!.nickname as String;
    final String questionContent = data.questions!.question as String;
    final String ago = data.questions!.remaining as String;

    // 게시물 이미지
    final List<String> contentImgList = data.questions!.photo ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 17.5.w,
                        height: 17.5.w,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            'Q',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              color: Colors.white,
                              height: 1.h,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        private == '1' ? questionName : '익명',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          fontSize: 11.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        ago,
                        style: AppTextStyle.hintStyle.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showProfileNewCardMore(context);
                    },
                    child: Icon(
                      Icons.more_horiz,
                      size: 20.w,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questionContent,
                    style: AppTextStyle.boldTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  if (contentImgList.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.w),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://files.heftykrcdn.com/wp-content/uploads/2017/11/c4ca4238a0b923820dcc509a6f75849b10.jpg',
                              width: 45.w,
                              height: 45.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 45.w,
                            height: 45.w,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: Text(
                                '+${contentImgList.length}',
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        if (isMyData == 1)
          Container(
            width: 1.sw,
            height: 30.h,
            color: const Color(0xffefefef),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.push('/ask',
                          extra: {'question': data, 'type': 'new'});
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsConstants.commentWrite,
                            width: 12.5.w,
                            height: 12.5.w,
                          ),
                          SizedBox(width: 7.5.w),
                          Text(
                            '답변작성',
                            style: AppTextStyle.greyStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(profileControllerProvider.notifier)
                          .rejectQuestion(
                            questionSeq: data.questions!.seq as int,
                            ref: ref,
                            // 본인 프로필에서 거절할 수 있으니까 본인 seq.
                            userSeq: userInfo!.userInfo!.seq as int,
                          );
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsConstants.clear,
                            width: 12.5.w,
                            height: 12.5.w,
                            color: AppColor.greyColor,
                          ),
                          SizedBox(width: 7.5.w),
                          Text(
                            '거절하기',
                            style: AppTextStyle.greyStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 0.5.h,
            color: AppColor.hintColor.withOpacity(0.5),
          ),
      ],
    );
  }
}
