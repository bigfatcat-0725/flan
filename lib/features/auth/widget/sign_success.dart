import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/theme.dart';

class SignSuccess extends ConsumerWidget {
  const SignSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      content: SizedBox(
        width: 290.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '회원가입 완료',
              style: AppTextStyle.boldTextStyle.copyWith(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '회원가입이 완료되었습니다.',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 5.h),
                Text(
                  'FLAN에서 제공하는 서비스를 이용해보세요.',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    context.go('/login');
                  },
                  child: Container(
                    width: 1.sw,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColor.textColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '로그인 페이지로 돌아가기',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
}
