import 'package:flan/apis/auth_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/widget/sign_error.dart';
import 'package:flan/features/auth/widget/sign_success.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
  );
});

// current user
final userInfoProvier = StateProvider<UserModel?>((ref) {
  return null;
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({
    required AuthAPI authAPI,
  })  : _authAPI = authAPI,
        super(false);

  void login({
    required String email,
    required String password,
    required String fcmToken,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;

    // 자동로그인
    final settingBox = Hive.box('settingBox');
    settingBox.put('id', email);
    settingBox.put('pw', password);
    //

    final res = await _authAPI.login(
      email: email,
      password: password,
      fcmToken: 'test',
    );
    state = false;
    res.fold(
      (l) {
        // loginShowSnackBar(context, l.message);
        if (context.mounted) {
          context.go('/login');
        }
      },
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);
        if (r.userInfo == null && r.tokenType != null) {
          // loginShowSnackBar(context, r.tokenType.toString());
        } else {
          // 로그아웃 -> 로그인 시 IndexedStack 으로 인한 프로필 화면 시작 문제.
          // 로그인 시 홈 화면으로 지정.
          ref.read(bottomNavProvier.notifier).onChange(0);
          context.go('/');
        }
      },
    );
  }

  void sign({
    required String nickname,
    required String email,
    required String password,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _authAPI.sign(nickname, email, password);
    state = false;
    res.fold(
      (l) => null,
      (r) {
        print(r);
        if (r == 200) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return const SignSuccess();
            },
          );
        }
        if (r == 201) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return SignError(error: r);
            },
          );
        }
        if (r == 202) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return SignError(error: r);
            },
          );
        }
      },
    );
  }

  void logout(BuildContext context) async {
    state = true;
    // 자동로그인 정보 지우기.
    final settingBox = Hive.box('settingBox');
    settingBox.put('id', null);
    settingBox.put('pw', null);
    await _authAPI.logout();
    state = false;
  }
}
