import 'package:flan/constants/ui_constants.dart';
import 'package:flan/features/community/widget/detail_comment_card.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunityDetailScreen extends HookConsumerWidget {
  const CommunityDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '상세보기'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35.w,
                            height: 17.5.w,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                'Q&A',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '익명',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 11.sp,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '방금 전',
                            style: AppTextStyle.hintStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '지금 당신은 코딩을 하고 있습니까?',
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    // physics: const ClampingScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: const DetailCommentCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 40.h,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/community_ask');
              },
              child: CupertinoTabBar(
                backgroundColor: AppColor.scaffoldBackgroundColor,
                items: [
                  BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 1.sw / 2,
                          height: 40.h,
                          color: AppColor.scaffoldBackgroundColor,
                          padding: EdgeInsets.only(left: 16.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '댓글입력...',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 13.sp,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
