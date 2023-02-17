import 'package:flan/constants/assets_constants.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          context.go('/login');
        }
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsConstants.logo,
                  height: 35.h,
                  color: AppColor.textColor,
                ),
                SizedBox(width: 15.w),
                SvgPicture.asset(
                  AssetsConstants.fontLogo,
                  height: 30.h,
                  color: AppColor.textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
