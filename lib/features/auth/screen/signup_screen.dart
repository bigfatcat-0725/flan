import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../theme/theme.dart';

final signNameControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final signEmailControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
final signPwControllerProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(signNameControllerProvider);
    final emailController = ref.watch(signEmailControllerProvider);
    final pwController = ref.watch(signPwControllerProvider);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '회원가입'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.fontLogo,
            height: 30.h,
            color: AppColor.primaryColor,
          ),
          SizedBox(height: 20.h),
          Text(
            'FLAN 에 오신 것을 환영합니다.',
            textAlign: TextAlign.center,
            style: AppTextStyle.defaultTextStyle.copyWith(
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 2.5.h),
          Text(
            '간편 회원가입을 하고 익명 질문을 주고받아 보세요.',
            textAlign: TextAlign.center,
            style: AppTextStyle.defaultTextStyle.copyWith(
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: nameController,
              cursorColor: AppColor.greyColor,
              style: AppTextStyle.defaultTextStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor,
                  ),
                ),
                hintText: '닉네임을 입력하세요.',
                hintStyle: AppTextStyle.hintStyle,
                contentPadding: EdgeInsets.all(15.w),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: emailController,
              cursorColor: AppColor.greyColor,
              style: AppTextStyle.defaultTextStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor,
                  ),
                ),
                hintText: '이메일을 입력하세요.',
                hintStyle: AppTextStyle.hintStyle,
                contentPadding: EdgeInsets.all(15.w),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: pwController,
              cursorColor: AppColor.greyColor,
              style: AppTextStyle.defaultTextStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 1.w,
                    color: AppColor.hintColor,
                  ),
                ),
                hintText: '비밀번호를 입력하세요.',
                hintStyle: AppTextStyle.hintStyle,
                contentPadding: EdgeInsets.all(15.w),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              ref.read(authControllerProvider.notifier).sign(
                    nickname: nameController.text,
                    email: emailController.text,
                    password: pwController.text,
                    context: context,
                    ref: ref,
                  );
            },
            child: Container(
              width: 1.sw,
              height: 40.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  '회원가입',
                  style: AppTextStyle.defaultTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FLAN 의 계정이 있다면 ?',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    '로그인',
                    style: AppTextStyle.boldTextStyle.copyWith(
                      fontSize: 13.sp,
                      color: AppColor.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Text(
                '하세요.',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '가입하면 FLAN 의 ',
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 약관
                    },
                    child: Text(
                      '약관',
                      style: AppTextStyle.boldTextStyle.copyWith(
                        fontSize: 13.sp,
                        decoration: TextDecoration.underline,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    ' 및 ',
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 약관
                    },
                    child: Text(
                      '개인정보취급방침',
                      style: AppTextStyle.boldTextStyle.copyWith(
                        fontSize: 13.sp,
                        decoration: TextDecoration.underline,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    '에',
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '동의하게 됩니다.',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
