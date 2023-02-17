import 'package:flan/constants/assets_constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/auth/widget/find_pw_alert.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idController = useTextEditingController();
    final pwController = useTextEditingController();

    // 자동로그인
    void autoLogin() async {
      final settingBox = Hive.box('settingBox');
      final id = settingBox.get('id');
      final pw = settingBox.get('pw');

      if (id != null && pw != null) {
        ref.read(authControllerProvider.notifier).login(
              email: id,
              password: pw,
              fcmToken: 'test',
              context: context,
              ref: ref,
            );
      }
    }

    useEffect(() {
      Future.microtask(() {
        autoLogin();
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  AssetsConstants.logo,
                  height: 35.h,
                  color: AppColor.primaryColor,
                ),
                SizedBox(height: 10.h),
                SvgPicture.asset(
                  AssetsConstants.fontLogo,
                  height: 30.h,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '익명으로 질문을 주고 받아보실 수 있습니다.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    '작성자는 익명으로 보장해드립니다.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                controller: idController,
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
                obscureText: true,
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
            SizedBox(height: 5.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return const FindPwAlert();
                        },
                      );
                    },
                    child: Text(
                      '비밀번호 찾기',
                      style: AppTextStyle.greyStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () async {
                ref.read(authControllerProvider.notifier).login(
                      email: idController.text,
                      password: pwController.text,
                      fcmToken: 'test',
                      ref: ref,
                      context: context,
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
                    '로그인',
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Container(
            //           height: 1.h,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(100),
            //             color: AppColor.hintColor,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.symmetric(
            //           horizontal: 20.w,
            //         ),
            //         child: Text(
            //           '또는',
            //           style: AppTextStyle.defaultTextStyle,
            //         ),
            //       ),
            //       Expanded(
            //         child: Container(
            //           height: 1.h,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(100),
            //             color: AppColor.hintColor,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 15.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: 45.w,
            //       height: 45.w,
            //       padding: EdgeInsets.all(5.w),
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.circle,
            //       ),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(100),
            //         child: FittedBox(
            //           child: Image.asset(
            //             AssetsConstants.zalo,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 15.w),
            //     Container(
            //       width: 45.w,
            //       height: 45.w,
            //       padding: EdgeInsets.all(5.w),
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.circle,
            //       ),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(100),
            //         child: Image.asset(
            //           AssetsConstants.facebook,
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 15.w),
            //     Container(
            //       width: 45.w,
            //       height: 45.w,
            //       padding: EdgeInsets.all(5.w),
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.circle,
            //       ),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(100),
            //         child: FittedBox(
            //           child: Image.asset(AssetsConstants.google),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 30.h),
            Text(
              'FLAN은 처음이신가요?',
              style: AppTextStyle.defaultTextStyle,
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                context.push('/sign');
              },
              child: Container(
                width: 1.sw,
                height: 40.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1.w,
                    color: AppColor.hintColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '간편 회원가입',
                    style: AppTextStyle.defaultTextStyle.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
