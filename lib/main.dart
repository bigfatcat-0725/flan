import 'package:flan/router/router.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Default Setting 불러오기
  await Hive.initFlutter();
  await Hive.openBox('settingBox');
  final settingBox = Hive.box('settingBox');
  final themeColor = settingBox.get('color');
  // Theme Color
  if (themeColor != null) {
    AppColor.primaryColor = Color(themeColor);
  }
  //

  runApp(const ProviderScope(child: MyApp()));
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
