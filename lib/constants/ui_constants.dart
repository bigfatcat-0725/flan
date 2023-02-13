import 'package:flan/constants/assets_constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/community/screen/community_screen.dart';
import 'package:flan/features/main/screen/main_screen.dart';
import 'package:flan/features/profile/screen/profile_screen.dart';
import 'package:flan/features/search/screen/search_screen.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class UIConstants {
  static AppBar appBar(
      BuildContext context, String category, String profileAddress,
      {required int index}) {
    return AppBar(
      toolbarHeight: 30.h,
      elevation: 0,
      leadingWidth: 0,
      titleSpacing: 0,
      backgroundColor: AppColor.scaffoldBackgroundColor,
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [Container()],
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                // child: Text(
                //   // 'FLAN˘',
                //   'FLAN',
                //   style: AppTextStyle.boldTextStyle.copyWith(
                //     color: AppColor.primaryColor,
                //     fontSize: 22.5.sp,
                //     height: 1.5,
                //   ),
                // ),
                child: Container(
                  padding: EdgeInsets.only(top: 5.h),
                  child: SvgPicture.asset(
                    AssetsConstants.fontLogo,
                    height: 12.5.h,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
            if (index == 1)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    context.push('/category');
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.toString(),
                          style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20.w,
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (index == 3)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(text: 'flan.com/admin'),
                    );
                    showDefaultDialog(context, '클립보드에 복사되었습니다.');
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profileAddress.toString(),
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            fontSize: 15.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (index == 3)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 22.5.w,
                          color: AppColor.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              )
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go('/bell');
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.bell,
                        width: 25.w,
                        height: 25.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  static AppBar qaAppBar(BuildContext context, String title) {
    return AppBar(
      toolbarHeight: 30.h,
      automaticallyImplyLeading: false,
      elevation: 0,
      leadingWidth: 0,
      titleSpacing: 0,
      backgroundColor: AppColor.scaffoldBackgroundColor,
      centerTitle: false,
      title: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 30.h,
              padding: EdgeInsets.only(left: 16.w),
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    AssetsConstants.clear,
                    width: 20.w,
                    height: 20.w,
                    color: title == '회원가입'
                        ? AppColor.textColor
                        : AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 30.h,
              child: Center(
                child: Text(
                  title,
                  style: AppTextStyle.boldTextStyle.copyWith(
                    fontSize: 14.sp,
                    color: title == '회원가입'
                        ? AppColor.textColor
                        : AppColor.primaryColor,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30.h,
            ),
          ),
        ],
      ),
    );
  }

  static Drawer appDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 160.h,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '관리자',
                        style: AppTextStyle.boldTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      GestureDetector(
                        onTap: () {
                          // 클립보드 복사
                          Clipboard.setData(
                            const ClipboardData(text: 'flan.com/admin'),
                          );
                          showDefaultDialog(context, '클립보드에 복사되었습니다.');
                        },
                        child: Text(
                          'flan.com/admin',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 15.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 1.sw,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1.5.w,
                                color: Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '내 플랑',
                                    style:
                                        AppTextStyle.defaultTextStyle.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' 0',
                                    style: AppTextStyle.boldTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showPrepareDialog(context);
                            },
                            child: Container(
                              width: 1.sw,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 1.5.w,
                                  color: Colors.white,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '플랑 충전',
                                  style: AppTextStyle.defaultTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              showPrepareDialog(context);
            },
            leading: SvgPicture.asset(
              AssetsConstants.logo,
              width: 17.5.w,
              height: 17.5.w,
              color: AppColor.greyColor,
            ),
            title: Text(
              '플랑 샵',
              style: AppTextStyle.defaultTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              context.go('/drawer_profile');
            },
            leading: SvgPicture.asset(
              AssetsConstants.profile,
              width: 17.5.w,
              height: 17.5.w,
              color: AppColor.greyColor,
            ),
            title: Text(
              '프로필 설정',
              style: AppTextStyle.defaultTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              context.go('/drawer_community');
            },
            leading: SvgPicture.asset(
              AssetsConstants.community,
              width: 17.5.w,
              height: 17.5.w,
              color: AppColor.greyColor,
            ),
            title: Text(
              '커뮤니티 관리',
              style: AppTextStyle.defaultTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              context.go('/drawer_info');
            },
            leading: Icon(
              Icons.info_outline_rounded,
              size: 20.w,
              color: AppColor.greyColor,
            ),
            title: Text(
              '고객센터',
              style: AppTextStyle.defaultTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              context.go('/drawer_setting');
            },
            leading: Icon(
              Icons.settings_outlined,
              size: 20.w,
              color: AppColor.greyColor,
            ),
            title: Text(
              '설정',
              style: AppTextStyle.defaultTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  static const List<Widget> bottomTabBarPages = [
    MainScreen(),
    CommunityScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
}
