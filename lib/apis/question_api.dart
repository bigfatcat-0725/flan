import 'dart:convert';

import 'package:flan/core/type_defs.dart';
import 'package:flan/core/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final questionAPIProvider = Provider((ref) {
  return QuestionAPI();
});

class QuestionAPI {
  FutureEither<int> postQuestion({
    required int user,
    required int to,
    required String title,
    required String private,
  }) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/questions');

      final request = http.MultipartRequest("POST", url)
        ..fields['user_seq'] = user.toString()
        ..fields['to_seq'] = to.toString()
        ..fields['question'] = title.toString()
        ..fields['private'] = private.toString();

      final response = await request.send();
      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  Future<void> deleteQuestion({
    required questionSeq,
  }) async {
    final url = Uri.parse('http://topping.io:8855/API/questions/$questionSeq');
    final request = await http.delete(
      url,
      headers: {
        "accept": "application/json",
      },
    );
  }

  // 거절 따로 만들어달라하고 seq만 넣기.
  Future<void> rejectQuestion({
    required int questionSeq,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/questions/status/update/$questionSeq');

    final request = await http.put(
      url,
      headers: {
        "accept": "application/json",
      },
    );
  }

  Future<int> likeQuestion({
    required int questionSeq,
    required int userSeq,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/questions/like/update/$questionSeq?user_seq=$userSeq');
    final request = await http.put(
      url,
      headers: {
        "accept": "application/json",
      },
    );

    return request.statusCode;
  }

  Future<int> isLikeQuestion({
    required userSeq,
    required questionSeq,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/likes/like/log?user_seq=$userSeq&seq=$questionSeq&like_type=q');
    final request = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    return int.parse(request.body);
  }
}
