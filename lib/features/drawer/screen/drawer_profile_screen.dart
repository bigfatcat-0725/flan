import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
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

    final profilePic = useState((userInfo.photo != '' && userInfo.photo != null)
        ? 'http://topping.io:8855${userInfo.photo}'
        : '');
    final selectPic = useState(false);

    final search = useState(false);
    final private = useState(false);
    final recommend = useState(false);

    void photoChange(file) {
      ref.read(drawerControllerProvider.notifier).changePhoto(
            userModel: userModel,
            photo: file,
            ref: ref,
            context: context,
          );
    }

    useEffect(() {
      if (context.mounted) {
        search.value = private.value = userInfo.nameSearch == 1 ? true : false;
        recommend.value = userInfo.proposal == 1 ? true : false;
        private.value = userInfo.unknownQ == 1 ? true : false;
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, 'cài đặt thông tin'),
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
                          'thay đổi hình ảnh',
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
                      'nhận dạng',
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
                      'tên nick',
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
                      'giới thiệu hồ sơ',
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
                                        ? 'giới thiệu hồ sơ'
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
                      'Địa chỉ Chi tiết',
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
                              'flan.com/${userInfo.email?.split('@')[0]}',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'quyền tìm kiếm của người dùng',
                    style: AppTextStyle.boldTextStyle,
                  ),
                  CupertinoSwitch(
                    activeColor: AppColor.primaryColor,
                    value: search.value,
                    onChanged: (value) {
                      search.value = !search.value;

                      ref
                          .read(drawerControllerProvider.notifier)
                          .changeProfileOption(
                            userModel: userModel,
                            option: 'search',
                            value: search.value ? 1 : 0,
                            ref: ref,
                            context: context,
                          );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'làm phiền xin phép',
                    style: AppTextStyle.boldTextStyle,
                  ),
                  CupertinoSwitch(
                    activeColor: AppColor.primaryColor,
                    value: private.value,
                    onChanged: (value) {
                      private.value = !private.value;

                      final user = ref.watch(userInfoProvier);
                      print(user!.userInfo!.nameSearch);

                      ref
                          .read(drawerControllerProvider.notifier)
                          .changeProfileOption(
                            userModel: userModel,
                            option: 'unknown',
                            value: private.value ? 1 : 0,
                            ref: ref,
                            context: context,
                          );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'giới thiệu sự cho phép của bạn bè',
                    style: AppTextStyle.boldTextStyle,
                  ),
                  CupertinoSwitch(
                    activeColor: AppColor.primaryColor,
                    value: recommend.value,
                    onChanged: (value) {
                      recommend.value = !recommend.value;

                      ref
                          .read(drawerControllerProvider.notifier)
                          .changeProfileOption(
                            userModel: userModel,
                            option: 'proposal',
                            value: recommend.value ? 1 : 0,
                            ref: ref,
                            context: context,
                          );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
