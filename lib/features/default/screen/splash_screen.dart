import 'package:flan/constants/assets_constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 자동로그인
    void autoLogin() async {
      final settingBox = Hive.box('settingBox');
      final id = settingBox.get('id');
      final pw = settingBox.get('pw');

      if (id != null &&
          pw != null &&
          (id.toString().split('@')[1] != 'zalo.com')) {
        if (context.mounted) {
          ref.read(authControllerProvider.notifier).login(
                email: id,
                password: pw,
                fcmToken: 'test',
                context: context,
                ref: ref,
              );
        }
      } else {
        if (context.mounted) {
          context.go('/login');
        }
      }
    }

    useEffect(() {
      if (context.mounted) {
        Future.microtask(() async {
          await Future.delayed(const Duration(seconds: 2));
          autoLogin();
        });
        return null;
      }
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
