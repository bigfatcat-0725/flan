import 'dart:io';

import 'package:flan/constants/assets_constants.dart';
import 'package:flan/constants/reg_exp_constans.dart';
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
import 'package:zalo_flutter/zalo_flutter.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idController = useTextEditingController();
    final pwController = useTextEditingController();

    final errorText1 = useState('');
    final errorText2 = useState('');

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    AssetsConstants.logo,
                    height: 35.h,
                    color: AppColor.textColor,
                  ),
                  SizedBox(height: 10.h),
                  SvgPicture.asset(
                    AssetsConstants.fontLogo,
                    height: 30.h,
                    color: AppColor.textColor,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'B???n c?? th??? g???i v?? nh???n c??u h???i ???n danh.',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'C??c t??c gi??? ???????c ?????m b???o ???n danh.',
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
                  onChanged: (value) {
                    if (value == '') {
                      errorText1.value = '';
                    } else {
                      if (!RegExpConstants.email.hasMatch(value)) {
                        errorText1.value =
                            'N?? kh??ng ph???i l?? m???t ?????nh d???ng email.';
                      } else {
                        errorText1.value = '';
                      }
                    }
                  },
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
                    hintText: 'Vui l??ng nh???p email c???a b???n.',
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
              ),
              if (errorText1.value != '')
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorText1.value,
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: AppColor.errorColor,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  controller: pwController,
                  onChanged: (value) {
                    if (value == '') {
                      errorText2.value = '';
                    } else {
                      if (!RegExpConstants.passwordRegExp1.hasMatch(value)) {
                        errorText2.value = 'Kh??ng qu?? 8 ch??? + s???.';
                      } else {
                        errorText2.value = '';
                      }
                    }
                  },
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
                    hintText: 'Vui l??ng nh???p m???t kh???u.',
                    hintStyle: AppTextStyle.hintStyle,
                    contentPadding: EdgeInsets.all(15.w),
                  ),
                ),
              ),
              if (errorText2.value != '')
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 16.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      errorText2.value,
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: AppColor.errorColor,
                        fontSize: 11.sp,
                      ),
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
                        't??m m???t kh???u',
                        style: AppTextStyle.greyStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  if (errorText1.value == '' && errorText2.value == '') {
                    ref.read(authControllerProvider.notifier).login(
                          email: idController.text,
                          password: pwController.text,
                          fcmToken: 'test',
                          ref: ref,
                          context: context,
                        );
                  }
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
                      '????ng nh???p',
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColor.hintColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Text(
                        'ho???c',
                        style: AppTextStyle.defaultTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColor.hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var data = await ZaloFlutter.login();
                      print(data);
                      var userData;
                      if (Platform.isIOS) {
                        userData = await ZaloFlutter.getUserProfile(
                          accessToken: data!['data']['accessToken'],
                        );
                      } else {
                        userData = await ZaloFlutter.getUserProfile(
                          accessToken: data!['data']['access_token'],
                        );
                      }
                      print(userData);
                      if (userData!['isSuccess']) {
                        if (context.mounted) {
                          ref.read(authControllerProvider.notifier).sign(
                                nickname: userData['data']['name'],
                                email: '${userData['data']['name']}@zalo.com',
                                password: 'flanzalo1234',
                                type: 'zalo',
                                context: context,
                                ref: ref,
                              );
                          print('zalo ????????????');
                        }
                      }
                    },
                    child: Container(
                      width: 45.w,
                      height: 45.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FittedBox(
                          child: Image.asset(
                            AssetsConstants.zalo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 15.w),
                  // Container(
                  //   width: 45.w,
                  //   height: 45.w,
                  //   padding: EdgeInsets.all(5.w),
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: Image.asset(
                  //       AssetsConstants.facebook,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(width: 15.w),
                  // Container(
                  //   width: 45.w,
                  //   height: 45.w,
                  //   padding: EdgeInsets.all(5.w),
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     shape: BoxShape.circle,
                  //   ),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: FittedBox(
                  //       child: Image.asset(AssetsConstants.google),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'B???n m???i s??? d???ng FLAN?',
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
                      '????ng k?? th??nh vi??n ????n gi???n',
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
      ),
    );
  }
}
