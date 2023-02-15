import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerProfileScreen extends HookConsumerWidget {
  const DrawerProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!.userInfo!;
    final userModel = ref.watch(userInfoProvier)!;

    final profilePic = useState('http://topping.io:8855${userInfo.photo!}');
    final selectPic = useState(false);

    void photoChange(file) {
      ref.read(drawerControllerProvider.notifier).changePhoto(
            userModel: userModel,
            photo: file,
            ref: ref,
            context: context,
          );
    }

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '내 정보'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  // File 로 return 옴.
                  final file = await pickImage();
                  if (file != null) {
                    profilePic.value = file.path;
                    photoChange(file);
                    selectPic.value = true;
                  }
                },
                child: Column(
                  children: [
                    profilePic.value == ''
                        ? SvgPicture.asset(
                            AssetsConstants.noImg,
                            width: 85.w,
                            height: 85.w,
                            fit: BoxFit.cover,
                          )
                        : selectPic.value
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(
                                  File(profilePic.value),
                                  width: 85.w,
                                  height: 85.w,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: profilePic.value,
                                  placeholder: (context, text) {
                                    return SvgPicture.asset(
                                      AssetsConstants.noImg,
                                    );
                                  },
                                  width: 85.w,
                                  height: 85.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.camera,
                          width: 17.5.w,
                          height: 17.5.w,
                          color: AppColor.textColor,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '사진변경',
                          style: AppTextStyle.defaultTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      '아이디',
                      style: AppTextStyle.boldTextStyle,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // 아이디 고정
                      },
                      child: Align(
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: AppColor.hintColor,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(userInfo.email.toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      '사용자 이름',
                      style: AppTextStyle.boldTextStyle,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push('/drawer_profile/edit',
                            extra: {'type': 'name'});
                      },
                      child: Align(
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: AppColor.hintColor,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  userInfo.nickname.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15.w,
                                  color: AppColor.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      '프로필 소개',
                      style: AppTextStyle.boldTextStyle,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push('/drawer_profile/edit',
                            extra: {'type': 'desc'});
                      },
                      child: Align(
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: AppColor.hintColor,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    (userInfo.memo.toString() == 'null' ||
                                            userInfo.memo.toString() == '')
                                        ? '프로필 소개'
                                        : userInfo.memo.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        AppTextStyle.defaultTextStyle.copyWith(
                                      color: (userInfo.memo.toString() ==
                                                  'null' ||
                                              userInfo.memo.toString() == '')
                                          ? AppColor.hintColor
                                          : AppColor.textColor,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15.w,
                                  color: AppColor.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Text(
                      '프로필 주소',
                      style: AppTextStyle.boldTextStyle,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Align(
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: AppColor.hintColor,
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'flan.com/${userInfo.email!.split('@')[0]}',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
