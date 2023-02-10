import 'package:flan/constants/constants.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BellScreen extends HookConsumerWidget {
  const BellScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '알림'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  tileColor: index == 0 ? Colors.white : null,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.5.h,
                  ),
                  shape: Border(
                    bottom: BorderSide(
                      width: 0.25.w,
                      color: AppColor.hintColor,
                    ),
                    top: index == 0
                        ? BorderSide(
                            width: 0.25.w,
                            color: AppColor.hintColor,
                          )
                        : const BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 알림 세부 기획 필요.
                        // 누군가 당신에게 질문을 남겼습니다.
                        // 누군가 당신이 남긴 질문에 답변을 했습니다.
                        // 누구 님이 당신을 팔로우하기 시작했습니다.
                        Expanded(
                          child: Text(
                            '누군가 당신에게 질문을 남겼습니다.',
                            style: AppTextStyle.defaultTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '방금 전',
                          style: AppTextStyle.hintStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
