import 'package:firebase_core/firebase_core.dart';
import 'package:flan/firebase_options.dart';
import 'package:flan/router/router.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// admob
const Map<String, String> unitID = kReleaseMode
    ? {
        'ios': 'ca-app-pub-2502401331982546/8897006724',
        'android': 'ca-app-pub-2502401331982546/1589362343',
      }
    : {
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };

const Map<String, String> nativeUnitID = kReleaseMode
    ? {
        'ios': 'ca-app-pub-2502401331982546/9670762840',
        'android': 'ca-app-pub-2502401331982546~6988759183',
      }
    : {
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MobileAds.instance.initialize();
  // Default Setting 불러오기
  await Hive.initFlutter();
  await Hive.openBox('settingBox');
  final settingBox = Hive.box('settingBox');
  final themeColor = settingBox.get('color');
  // Theme Color
  if (themeColor != null) {
    AppColor.primaryColor = const Color(0xff407070);
    // AppColor.primaryColor = AppColor.textColor;
  }
  //

  runApp(ProviderScope(
    observers: [],
    child: const MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      builder: (_, __) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTextTheme.theme,
          routerConfig: router,
        ),
      ),
    );
  }
}
