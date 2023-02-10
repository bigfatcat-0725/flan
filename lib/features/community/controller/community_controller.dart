import 'package:flan/apis/comment_api.dart';
import 'package:flan/apis/page_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  return CommunityController(
    pageAPI: ref.watch(pageAPIProvider),
    commentAPI: ref.watch(commentAPIProvider),
  );
});

final pageProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getPage(seq);
});

class CommunityController extends StateNotifier<bool> {
  final PageAPI _pageAPI;
  final CommentAPI _commentAPI;
  CommunityController({
    required PageAPI pageAPI,
    required CommentAPI commentAPI,
  })  : _pageAPI = pageAPI,
        _commentAPI = commentAPI,
        super(false);

  // Future<List<CommentModel>> getComment(int seq) async {
  //   final res = await _pageAPI.getPage(seq);
  //   final pageList = res.map((e) => PageModel.fromJson(e)).toList();
  //   return pageList;
  // }

  Future<List<PageModel>> getPage(int seq) async {
    final res = await _pageAPI.getPage(seq);
    final pageList = res.map((e) => PageModel.fromJson(e)).toList();
    return pageList;
  }

  void postPage({
    required int user,
    required int theme,
    required String title,
    required String content,
    required String private,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _pageAPI.postPage(
      user: user,
      theme: theme,
      title: title,
      content: content,
      private: private,
    );
    state = false;
    // print('${user} ${theme} ${title} ${content} ${status}');
    // print(res);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        if (r == 200) {
          // refresh 가 안된다..
          showSnackBar(context, '작성 완료.');
          context.push('/');
        }
      },
    );
  }
}
