import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerSettingScreen extends HookConsumerWidget {
  const DrawerSettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingList = ['알림 설정', '비밀번호 변경', '로그아웃'];
    final settingGoList = [
      // '/drawer_setting/theme',
      '/drawer_setting/bell',
      // '/drawer_setting/language',
      '/drawer_setting/password',
      '/login',
    ];

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '설정'),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    if (settingList[index] == '로그아웃') {
                      ref.read(authControllerProvider.notifier).logout(context);
                      context.go(settingGoList[index]);
                      return;
                    }
                    context.push(settingGoList[index]);
                  },
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
                        Expanded(
                          child: Text(
                            settingList[index],
                            style: AppTextStyle.defaultTextStyle,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.w,
                          color: AppColor.greyColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: settingList.length,
            ),
          ),
        ],
      ),
    );
  }
}
