import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flan/firebase_options.dart';
import 'package:flan/router/router.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zalo_flutter/zalo_flutter.dart';

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

Future<void> _initZaloFlutter() async {
  if (Platform.isAndroid) {
    final hashKey = await ZaloFlutter.getHashKeyAndroid();
    print('HashKey: $hashKey');
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

// local noti
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);
bool isFlutterLocalNotificationsInitialized = false;
//

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  // iOS foreground notification 권한
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // IOS background 권한 체킹 , 요청
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // 토큰 요청
  getToken();
  // 셋팅flag 설정
  isFlutterLocalNotificationsInitialized = true;
}

Future<void> getToken() async {
  // ios
  String? token;
  if (defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    token = await FirebaseMessaging.instance.getAPNSToken();
  }
  // aos
  else {
    token = await FirebaseMessaging.instance.getToken();
  }
  if (kDebugMode) {
    print("fcmToken : $token");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FCM
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('data: ${message.messageType}');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final token = await FirebaseMessaging.instance.getToken();
  print('token ${token}');
  //

  _initZaloFlutter();
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
  } else {
    AppColor.primaryColor = const Color(0xff407070);
  }
  //

  runZonedGuarded(
    () => runApp(ProviderScope(
      observers: [],
      child: const MyApp(),
    )),
    (error, stack) {},
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// fcm 배경 처리 (종료되어있거나, 백그라운드에 경우)
    @pragma('vm:entry-point')
    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await setupFlutterNotifications(); // 셋팅 메소드
      //showFlutterNotification(message);  // 로컬노티
    }

    /// fcm 전경 처리 - 로컬 알림 보이기
    void showFlutterNotification(RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        // 웹이 아니면서 안드로이드이고, 알림이 있는경우
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name, channel.description,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    }

    void _handleMessage(RemoteMessage message) {
      // 내가 지정한 그 알람이면? 지정한 화면으로 이동
      // if (message.data['data1'] == 'value1') {
      //   Navigator.pushNamed(context, '/notification');
      print('handle');
      // }
    }

    useEffect(() {
      if (context.mounted) {
        // foreground 수신처리
        FirebaseMessaging.onMessage.listen(showFlutterNotification);
        // background 수신처리
        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
        FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
      }
    });

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
