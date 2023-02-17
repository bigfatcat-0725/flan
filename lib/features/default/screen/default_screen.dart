import 'package:animations/animations.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/screen/community_screen.dart';
import 'package:flan/features/main/screen/main_screen.dart';
import 'package:flan/features/profile/screen/profile_screen.dart';
import 'package:flan/features/search/screen/search_screen.dart';
import 'package:flan/main.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
    final userProfileAddress = 'flan.com/${email?.split('@')[0]}';
    final userInfo = ref.watch(userInfoProvier)!;

    // admob
    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.fullBanner,
      adUnitId: unitID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: const AdRequest(),
    )..load();
    //

    List<Widget> bottomTabBarPages = [
      bottomNav == 0 ? const MainScreen() : Container(),
      bottomNav == 1 ? const CommunityScreen() : Container(),
      bottomNav == 2 ? const SearchScreen() : Container(),
      bottomNav == 3 ? const ProfileScreen() : Container(),
    ];

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.appBar(
        context,
        currentCategory,
        userProfileAddress,
        index: bottomNav,
        ref: ref,
      ),
      endDrawer: UIConstants.appDrawer(context, userInfo: userInfo),
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
          child: Column(
            children: [
              Container(
                width: AdSize.fullBanner.width.toDouble(),
                height: AdSize.fullBanner.height.toDouble(),
                color: AppColor.hintColor.withOpacity(0.1),
                child: AdWidget(
                  ad: banner,
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: bottomNav,
                  key: ValueKey<int>(bottomNav),
                  children: bottomTabBarPages,
                ),
              ),
            ],
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
        height: 30.h,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.main,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 0 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.community,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 1 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.search,
              width: 17.5.w,
              height: 17.5.w,
              color:
                  bottomNav == 2 ? AppColor.primaryColor : AppColor.hintColor,
            ),
          ),
          BottomNavigationBarItem(
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
