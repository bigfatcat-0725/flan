import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCardReject extends HookConsumerWidget {
  final Question data;
  final int isMyData;
  const ProfileCardReject({
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
    final List<String> contentImgList = data.questions!.photo != null
        ? data.questions!.photo.toString().split(',')
        : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      showProfileNewCardMore(context,
                          ref: ref, qSeq: data.questions!.seq as int);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      questionContent,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.boldTextStyle.copyWith(
                        fontSize: 13.sp,
                      ),
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
            height: 25.h,
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
                      height: 25.h,
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
                            '답변',
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
                      showDelete(context,
                          ref: ref,
                          userSeq: userInfo!.userInfo!.seq as int,
                          questionSeq: data.questions!.seq as int);
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: 25.h,
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
                            '삭제',
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
