import 'dart:convert';
import 'dart:io';
import 'package:flan/apis/user_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../auth/controller/auth_controller.dart';

final drawerControllerProvider =
    StateNotifierProvider<DrawerController, bool>((ref) {
  return DrawerController(
    userAPI: ref.watch(userAPIProvider),
  );
});

final writtenProvider = FutureProvider.autoDispose.family((ref, int seq) {
  final communityContoller = ref.watch(drawerControllerProvider.notifier);
  return communityContoller.writtenPage(seq);
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
      (l) => null,
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);

        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.invalidate(feedProivder(feedSeqLogic));
        //

        // showSnackBar(context, '변경 완료.');
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
      (l) => null,
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);

        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.invalidate(feedProivder(feedSeqLogic));
        //

        // showSnackBar(context, '변경 완료.');
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
      (l) => null,
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);
        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.invalidate(feedProivder(feedSeqLogic));
        //
        // showSnackBar(context, '변경 완료.');
      },
    );
  }

  void changeProfileOption({
    required UserModel userModel,
    required String option,
    required int value,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _userAPI.changeProfileOption(
        userModel: userModel, option: option, value: value);
    res.fold(
      (l) => print(l.message),
      (r) {
        ref.read(userInfoProvier.notifier).update((state) => r);
        // 원래 피드로 돌아감 + refresh
        final feedSeq = ref.watch(feedSeqProvider);
        final feedSeqLogic =
            feedSeq == 0 ? userModel.userInfo!.seq as int : feedSeq;
        ref.invalidate(feedProivder(feedSeqLogic));
        // showSnackBar(context, '변경 완료.');
      },
    );
  }

  Future<List> writtenPage(seq) async {
    final url = Uri.parse('http://topping.io:8855/API/pages/written/page/$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    var list = response.map((e) => Pages.fromJson(e)).toList();
    print(list);
    return list;
  }
}
