import 'package:flan/core/type_defs.dart';
import 'package:flan/core/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final answerAPIProvider = Provider((ref) {
  return AnswerAPI();
});

class AnswerAPI {
  // 대댓글은 따로 처리 해야함.
  FutureEither<int> postAnswer({
    required int user,
    required int questionSeq,
    required String title,
  }) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/answers');

      final request = http.MultipartRequest("POST", url)
        ..fields['user_seq'] = user.toString()
        ..fields['question_seq'] = questionSeq.toString()
        ..fields['reply'] = title.toString();

      final response = await request.send();
      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEither<int> editAnswer({
    required int user,
    required int answerSeq,
    required String reply,
  }) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/answers/$answerSeq');

      final request = http.MultipartRequest("PUT", url)
        ..fields['reply'] = reply.toString();

      final response = await request.send();

      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
