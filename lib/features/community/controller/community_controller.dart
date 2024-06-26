import 'dart:convert';
import 'dart:io';

import 'package:flan/apis/comment_api.dart';
import 'package:flan/apis/page_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/features/main/controller/main_controller.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart' as BookModel;
import 'package:flan/models/comment/comment_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  return CommunityController(
    pageAPI: ref.watch(pageAPIProvider),
    commentAPI: ref.watch(commentAPIProvider),
  );
});

final pageProvider = FutureProvider.autoDispose((ref) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getAllPage();
});

final themePageProvider = FutureProvider.family((ref, String tag) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getThemePage(tag);
});
final onePageProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getPageOne(seq);
});

final commentProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getComment(seq);
});
final commentMyProvider = FutureProvider.family((ref, int seq) {
  final communityContoller = ref.watch(communityControllerProvider.notifier);
  return communityContoller.getMyComment(seq);
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

  Future<List<Comment>> getMyComment(int seq) async {
    final res = await _commentAPI.getMyComment(seq);

    final commentList = res.map((e) => Comment.fromJson(e)).toList();

    return commentList;
  }

  void postComment(
    List<File> imgList, {
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
    required PageModel pageModel,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      imgList,
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          final current = ref.watch(currentCategoryProvier);

          if (current == '전체') {
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

  void editComment(
    List<File> imgList, {
    required int user,
    required int commentSeq,
    required int pageSeq,
    required String reply,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _commentAPI.editComment(imgList,
        user: user, commentSeq: commentSeq, reply: reply);
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          ref.invalidate(commentProvider(pageSeq));
          context.pop();
        }
      },
    );
  }

  void postBookmarkComment(
    List<File> imgList, {
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
    required BookModel.BookmarkPageModel pageModel,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      imgList,
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => null,
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

  void postDrawerComment(
    List<File> imgList, {
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
    required Pages pageModel,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      imgList,
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          ref.invalidate(writtenProvider(user));
          context.pushReplacement('/drawer_community_detail', extra: {
            'page': pageModel,
          });
        }
      },
    );
  }

  void writtenComment(
    List<File> imgList, {
    required int user,
    required int page,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _commentAPI.postComment(
      imgList,
      user: user,
      page: page,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          ref.invalidate(writtenProvider(user));
          ref.invalidate(commentProvider(page));

          context.pushReplacement('/written_detail', extra: {
            'page': page,
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

  Future<PageModel> getPageOne(seq) async {
    final url = Uri.parse('http://topping.io:8855/API/pages/pages_one/$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = PageModel.fromJson(jsonDecode(decodeData));
    return response;
  }

  Future<List<PageModel>> getThemePage(String tag) async {
    List<PageModel> pageList = [];
    final res = await _pageAPI.getThemePage(tag: tag);
    pageList = [...res.map((e) => PageModel.fromJson(e)).toList()];
    return pageList;
  }

  void postPage(
    List<File> imgList, {
    required int user,
    required String tag,
    required String title,
    required String content,
    required String private,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _pageAPI.postPage(
      imgList,
      user: user,
      tag: tag,
      title: title,
      content: content,
      private: private,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          final current = ref.watch(currentCategoryProvier);

          if (current == '전체') {
            ref.invalidate(pageProvider);
          } else {
            ref.invalidate(themePageProvider(current));
          }
          context.push('/');
        }
      },
    );
  }

  void editPage(
    List<File> imgList, {
    required int page,
    required int theme,
    required String title,
    required String content,
    required String private,
    required String photo,
    required String tag,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _pageAPI.editPage(
      imgList,
      page: page,
      tag: tag,
      theme: theme,
      title: title,
      content: content,
      private: private,
      photo: photo,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          final current = ref.watch(currentCategoryProvier);

          if (current == '전체') {
            ref.invalidate(pageProvider);
          } else {
            ref.invalidate(themePageProvider(current));
          }
          final userSeq = ref.watch(userInfoProvier)!.userInfo!.seq as int;
          ref.invalidate(bookmarkPageProivder(userSeq));
          ref.invalidate(writtenProvider(userSeq));

          context.pop();
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
      final current = ref.watch(currentCategoryProvier);
      final userInfo = ref.watch(userInfoProvier);

      if (current == '전체') {
        ref.invalidate(pageProvider);
      } else {
        ref.invalidate(themePageProvider(current));
      }
      ref.invalidate(bookmarkPageProivder(userInfo!.userInfo!.seq as int));
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
    required BuildContext context,
  }) async {
    await _pageAPI.deletePage(
      pageSeq: pageSeq,
    );
    final current = ref.watch(currentCategoryProvier);

    if (current == '전체') {
      ref.invalidate(pageProvider);
    } else {
      ref.invalidate(themePageProvider(current));
    }
    // ref.invalidate(bookmarkPageProivder);
  }

  void deleteComment({
    required int seq,
    required PageModel page,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _commentAPI.deleteComment(seq: seq);
    if (res == 1) {
      final current = ref.watch(currentCategoryProvier);

      if (current == '전체') {
        ref.invalidate(pageProvider);
      } else {
        ref.invalidate(themePageProvider(current));
      }
      ref.invalidate(commentProvider(page.pages!.seq as int));

      if (context.mounted) {
        context.pop();
      }
    }
  }

  void deleteCommentDrawer({
    required int seq,
    required int page,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _commentAPI.deleteComment(seq: seq);
    if (res == 1) {
      final current = ref.watch(currentCategoryProvier);
      final userInfo = ref.watch(userInfoProvier);

      if (current == '전체') {
        ref.invalidate(pageProvider);
      } else {
        ref.invalidate(themePageProvider(current));
      }
      ref.invalidate(commentProvider(page));
      ref.invalidate(writtenProvider(userInfo!.userInfo!.seq as int));

      if (context.mounted) {
        context.pop();
      }
    }
  }
}
