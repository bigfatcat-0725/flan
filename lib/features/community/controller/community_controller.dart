import 'package:flan/apis/comment_api.dart';
import 'package:flan/apis/page_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/main/controller/main_controller.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart';
import 'package:flan/models/comment/comment_model.dart';
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

final pageProvider = FutureProvider((ref) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getAllPage();
});

final themePageProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getThemePage(seq);
});

final commentProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getComment(seq);
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

  Future<List<CommentModel>> getComment(int seq) async {
    final res = await _commentAPI.getComment(seq);
    final commentList = res.map((e) => CommentModel.fromJson(e)).toList();
    return commentList;
  }

  void postComment({
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
    required PageModel pageModel,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        if (r == 200) {
          final current = ref.watch(currentCategorySeqProvier);

          if (current == 0) {
            ref.invalidate(pageProvider);
          } else {
            ref.invalidate(themePageProvider(current));
          }
          // top3
          ref.invalidate(hotPageProvider('d'));
          ref.invalidate(hotPageProvider('w'));
          ref.invalidate(hotPageProvider('m'));
          ref.invalidate(hotPageProvider('y'));

          context.pushReplacement('/community_detail', extra: {
            'page': pageModel,
          });
        }
      },
    );
  }

  void postBookmarkComment({
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
    required BookmarkPageModel pageModel,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        if (r == 200) {
          ref.invalidate(bookmarkPageProivder(user));
          context.pushReplacement('/bookmark_community_detail', extra: {
            'page': pageModel,
          });
        }
      },
    );
  }

  Future<List<PageModel>> getAllPage() async {
    List<PageModel> pageList = [];
    final res = await _pageAPI.getAllPage();
    pageList = [...res.map((e) => PageModel.fromJson(e)).toList()];
    return pageList;
  }

  Future<List<PageModel>> getThemePage(int seq) async {
    List<PageModel> pageList = [];
    final res = await _pageAPI.getThemePage(seq: seq);
    pageList = [...res.map((e) => PageModel.fromJson(e)).toList()];
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
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        if (r == 200) {
          final current = ref.watch(currentCategorySeqProvier);
          if (current == 0) {
            ref.invalidate(pageProvider);
          } else {
            ref.invalidate(themePageProvider(current));
          }

          context.push('/');
        }
      },
    );
  }

  Future<bool> likePage({
    required int pageSeq,
    required int userSeq,
    required WidgetRef ref,
  }) async {
    final res = await _pageAPI.likePage(pageSeq: pageSeq, userSeq: userSeq);
    if (res == 200) {
      final current = ref.watch(currentCategorySeqProvier);
      if (current == 0) {
        ref.invalidate(pageProvider);
      } else {
        ref.invalidate(themePageProvider(current));
      }
      return true;
    } else {
      return false;
    }
  }

  Future<int> isLikePage({
    required int userSeq,
    required int pageSeq,
  }) async {
    final res = await _pageAPI.isLikePage(
      userSeq: userSeq,
      pageSeq: pageSeq,
    );

    return res;
  }

  void deletePage({
    required int pageSeq,
    required WidgetRef ref,
  }) async {
    await _pageAPI.deletePage(
      pageSeq: pageSeq,
    );
    final current = ref.watch(currentCategorySeqProvier);
    if (current == 0) {
      ref.invalidate(pageProvider);
    } else {
      ref.invalidate(themePageProvider(current));
    }
  }
}
