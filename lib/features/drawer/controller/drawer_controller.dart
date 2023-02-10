import 'dart:convert';
import 'dart:io';

import 'package:flan/apis/user_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/controller/auth_controller.dart';

final drawerControllerProvider =
    StateNotifierProvider<DrawerController, bool>((ref) {
  return DrawerController(
    userAPI: ref.watch(userAPIProvider),
  );
});

class DrawerController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  DrawerController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  void changeMemo({
    required UserModel userModel,
    required String memo,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _userAPI.changeMemo(userModel: userModel, memo: memo);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);

        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.refresh(feedProivder(feedSeqLogic));
        //

        showSnackBar(context, '변경 완료.');
        context.pop();
      },
    );
  }

  void changeName({
    required UserModel userModel,
    required String name,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _userAPI.changeName(userModel: userModel, name: name);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);

        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.refresh(feedProivder(feedSeqLogic));
        //

        showSnackBar(context, '변경 완료.');
        context.pop();
      },
    );
  }

  void changePhoto({
    required UserModel userModel,
    required File photo,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _userAPI.changePhoto(userModel: userModel, photo: photo);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);
        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.refresh(feedProivder(feedSeqLogic));
        //
        showSnackBar(context, '변경 완료.');
      },
    );
  }
}
