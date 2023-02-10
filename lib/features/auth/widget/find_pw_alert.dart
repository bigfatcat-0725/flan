import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final certControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final newPwControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// 1
class FindPwAlert extends HookConsumerWidget {
  const FindPwAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();

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
              '비밀번호 찾기',
              style: AppTextStyle.boldTextStyle.copyWith(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '비밀번호는 가입 시 입력하신',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 2.5.h),
                Text(
                  '이메일을 통해 찾을 수 있습니다.',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 15.h),
                TextField(
                  controller: emailController,
                  cursorColor: AppColor.greyColor,
                  style: AppTextStyle.defaultTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF3F5F6),
                    border: InputBorder.none,
                    hintText: '이메일을 입력하세요.',
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding: EdgeInsets.all(15.w),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    // go 2
                    context.pop();
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return const FindPwAlert2();
                      },
                    );
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
                        '비밀번호 찾기',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 13.sp,
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

// 2
class FindPwAlert2 extends ConsumerWidget {
  const FindPwAlert2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certController = ref.watch(certControllerProvider);
    final newPwController = ref.watch(newPwControllerProvider);

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
              '비밀번호 재설정',
              style: AppTextStyle.boldTextStyle.copyWith(
                fontSize: 17.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '입력하신 이메일로 인증번호를 발송하였습니다.',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 2.55.h),
                Text(
                  '새로운 비밀번호를 설정해주세요.',
                  style: AppTextStyle.defaultTextStyle,
                ),
                SizedBox(height: 15.h),
                TextField(
                  controller: certController,
                  cursorColor: AppColor.greyColor,
                  style: AppTextStyle.defaultTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF3F5F6),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: '인증번호를 입력하세요.',
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
                SizedBox(height: 10.h),
                TextField(
                  controller: newPwController,
                  cursorColor: AppColor.greyColor,
                  style: AppTextStyle.defaultTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF3F5F6),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.w, color: AppColor.hintColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: '새로운 비밀번호를 입력하세요.',
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding: EdgeInsets.all(15.w),
                  ),
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
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        '비밀번호 변경',
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
