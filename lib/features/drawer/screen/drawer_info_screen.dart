import 'package:flan/constants/constants.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerInfoScreen extends HookConsumerWidget {
  const DrawerInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        appBar: UIConstants.qaAppBar(context, '고객센터'),
        body: ListView(
          children: [
            SizedBox(height: 10.h),
            ListTile(
              onTap: () {
                // 상담사 프로필로 이동
                // 질문을 이용 **
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              title: Text(
                '1:1 문의',
                style: AppTextStyle.defaultTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15.w,
                color: AppColor.greyColor,
              ),
            ),
            ListTile(
              onTap: () {
                context.push('/drawer_info/notice');
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              title: Text(
                '공지사항',
                style: AppTextStyle.defaultTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15.w,
                color: AppColor.greyColor,
              ),
            ),
          ],
        ));
  }
}
