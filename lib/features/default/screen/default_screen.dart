import 'package:animations/animations.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultScreen extends HookConsumerWidget {
  const DefaultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNav = ref.watch(bottomNavProvier);
    final currentCategory = ref.watch(currentCategoryProvier);
    final email = ref.watch(userInfoProvier)!.userInfo!.email;
    final userProfileAddress = 'flan.com/${email!.split('@')[0]}';

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.appBar(
        context,
        currentCategory,
        userProfileAddress,
        index: bottomNav,
      ),
      endDrawer: UIConstants.appDrawer(context),
      body: Container(
        margin: EdgeInsets.only(top: 5.h),
        // IndexedStack 이동 간 애니메이션 구현을 위한 패키지 사용.
        child: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (widget, anim1, anim2) {
            return FadeTransition(
              opacity: anim1,
              child: widget,
            );
          },
          child: IndexedStack(
            index: bottomNav,
            key: ValueKey<int>(bottomNav),
            children: UIConstants.bottomTabBarPages,
          ),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: bottomNav,
        onTap: (index) {
          ref.read(bottomNavProvier.notifier).onChange(index);
        },
        backgroundColor: AppColor.scaffoldBackgroundColor,
        activeColor: AppColor.primaryColor,
        inactiveColor: AppColor.hintColor,
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: SvgPicture.asset(
              AssetsConstants.main,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 0 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '커뮤니티',
            icon: SvgPicture.asset(
              AssetsConstants.community,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 1 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: SvgPicture.asset(
              AssetsConstants.search,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 2 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '프로필',
            icon: SvgPicture.asset(
              AssetsConstants.profile,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 3 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
