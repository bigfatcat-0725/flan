import 'package:flan/constants/constants.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoNotice extends HookConsumerWidget {
  const InfoNotice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '공지사항'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  // tileColor: index == 0 ? Colors.white : null,
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
                          child: Row(
                            children: [
                              Text(
                                '2023.02.0${index + 1} 공지사항',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                              SizedBox(width: 5.w),
                              if (index == 0)
                                Icon(
                                  Icons.fiber_new_rounded,
                                  size: 20.w,
                                  color: AppColor.primaryColor,
                                ),
                            ],
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
