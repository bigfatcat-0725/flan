import 'dart:convert';
import 'dart:io';

import 'package:flan/apis/answer_api.dart';
import 'package:flan/apis/bookmark_api.dart';
import 'package:flan/apis/question_api.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/features/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final profileControllerProvider =
    StateNotifierProvider<ProfileController, bool>((ref) {
  return ProfileController(
    questionAPI: ref.watch(questionAPIProvider),
    answerAPI: ref.watch(answerAPIProvider),
    bookmarkAPI: ref.watch(bookmarkAPIProvider),
  );
});

class ProfileController extends StateNotifier<bool> {
  final QuestionAPI _questionAPI;
  final AnswerAPI _answerAPI;
  final BookmarkAPI _bookmarkAPI;
  ProfileController({
    required QuestionAPI questionAPI,
    required AnswerAPI answerAPI,
    required BookmarkAPI bookmarkAPI,
  })  : _questionAPI = questionAPI,
        _answerAPI = answerAPI,
        _bookmarkAPI = bookmarkAPI,
        super(false);

  void postQuestion(
    List<File> imgList, {
    required int user,
    required int to,
    required String title,
    required String private,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _questionAPI.postQuestion(
      imgList,
      user: user,
      to: to,
      title: title,
      private: private,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          // showSnackBar(context, '작성 완료.');
          context.pop();
          ref.invalidate(feedProivder(to));
        }
        if (r == 201) {
          showDefaultDialog(context, '익명 질문을 허용하지 않는 회원입니다.');
        }
      },
    );
  }

  void deleteQuestion({
    required int questionSeq,
    required WidgetRef ref,
    required int userSeq,
  }) async {
    await _questionAPI.deleteQuestion(questionSeq: questionSeq);
    // 삭제는 본인 피드니 자신의 피드를 리프레쉬.
    ref.invalidate(feedProivder(userSeq));
  }

  void rejectQuestion({
    required int questionSeq,
    required WidgetRef ref,
    required userSeq,
  }) async {
    await _questionAPI.rejectQuestion(questionSeq: questionSeq);
    ref.invalidate(feedProivder(userSeq));
  }

  Future<bool> likeQuestion({
    required int questionSeq,
    required int userSeq,
    required WidgetRef ref,
  }) async {
    final res = await _questionAPI.likeQuestion(
        questionSeq: questionSeq, userSeq: userSeq);
    if (res == 200) {
      ref.invalidate(feedProivder(userSeq));
      ref.invalidate(bookmarkQuestionProivder(userSeq));
      ref.invalidate(homeFeedProvider(userSeq));
      return true;
    } else {
      return false;
    }
  }

  Future<int> isLikeQuestion({
    required int userSeq,
    required int questionSeq,
  }) async {
    final res = await _questionAPI.isLikeQuestion(
      userSeq: userSeq,
      questionSeq: questionSeq,
    );
    return res;
  }

  Future<bool> pageBookmarking({
    required int user,
    required int page,
    required WidgetRef ref,
  }) async {
    final res = await _bookmarkAPI.pageBookmarking(user: user, page: page);
    if (res == 200) {
      if (page == 0) {
        ref.invalidate(pageProvider);
      } else {
        final current = ref.watch(currentCategoryProvier);
        ref.invalidate(themePageProvider(current));
      }
      ref.invalidate(bookmarkPageProivder(user));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> questionBookmarking({
    required int user,
    required int question,
    required WidgetRef ref,
  }) async {
    final res =
        await _bookmarkAPI.questionBookmarking(user: user, question: question);
    if (res == 200) {
      ref.invalidate(feedProivder(user));
      ref.invalidate(bookmarkQuestionProivder(user));
      ref.invalidate(homeFeedProvider(user));
      return true;
    } else {
      return false;
    }
  }

  // 프로필에서 답변을 한다는 것 자체가 자기 자신의 피드로 들어온 것임.
  void postAnswer(
    List<File> fileList, {
    required int user,
    required int questionSeq,
    required String title,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _answerAPI.postAnswer(
      fileList,
      user: user,
      questionSeq: questionSeq,
      title: title,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          ref.invalidate(feedProivder(user));
          ref.invalidate(bookmarkQuestionProivder(user));
          ref.invalidate(homeFeedProvider(user));
          context.pop();
        }
      },
    );
  }

  void editAnswer(
    List<File> imgList, {
    required String img,
    required int user,
    required int answerSeq,
    required String reply,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = true;
    final res = await _answerAPI.editAnswer(
      imgList,
      img: img,
      user: user,
      answerSeq: answerSeq,
      reply: reply,
    );
    state = false;
    res.fold(
      (l) => null,
      (r) {
        if (r == 200) {
          ref.invalidate(feedProivder(user));
          ref.invalidate(bookmarkQuestionProivder(user));
          ref.invalidate(homeFeedProvider(user));
          context.pop();
          context.pop();
        }
      },
    );
  }

  void deleteAnswer({
    required int seq,
    required int mySeq,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final res = await _answerAPI.deleteAnswer(seq: seq);
    if (res == 1) {
      // 본인 프로필에서 지우는거니까
      ref.invalidate(feedProivder(mySeq));
      ref.invalidate(bookmarkQuestionProivder(mySeq));
      ref.invalidate(homeFeedProvider(mySeq));
      if (context.mounted) {
        context.pop();
      }
    }
  }

  void follow({required int from, required int to}) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/users/follow/update/$to?from_user=$from');
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );
    print(response.statusCode);
  }

  Future<bool> isFollow({required int my, required int other}) async {
    final url =
        Uri.parse('http://topping.io:8855/API/follow/log/$my?other_seq=$other');
    final reqeust = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );
    final decodeData = utf8.decode(reqeust.bodyBytes);
    final response = jsonDecode(decodeData);

    if (reqeust.statusCode == 200) {
      return response == 1 ? true : false;
    } else {
      return false;
    }
  }
}
