import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/theme.dart';

class SignError extends ConsumerWidget {
  final int error;
  const SignError({
    Key? key,
    required this.error,
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
              error == 201 ? '중복 이메일' : '중복 닉네임',
              style: AppTextStyle.defaultTextStyle,
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                context.pop();
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
                    '확인',
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
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 30.h,
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }
}
