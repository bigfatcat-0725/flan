import 'dart:convert';
import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final authAPIProvider = Provider((ref) {
  return AuthAPI();
});

class AuthAPI {
  FutureEither<UserModel> login({
    required String email,
    required String password,
    required fcmToken,
  }) async {
    try {
      final data = await http.post(
        Uri.parse('http://topping.io:8855/API/users/login'),
        body: {
          'email': email,
          'password': password,
          'remember_token': fcmToken,
        },
        headers: {
          "accept": "application/json",
          "content-type": "application/x-www-form-urlencoded",
        },
      );

      final decodeData = utf8.decode(data.bodyBytes);
      final response = jsonDecode(decodeData);
      final userModel = UserModel.fromJson(response as Map<String, dynamic>);
      if (userModel.userInfo == null) {
        // 200을 주지만 에러 메세지를 주는 경우 때문에 만듬.
        // 어쩔 수 없이 tokenType 에 에러를 담아 보냄.
        return right(const UserModel().copyWith(tokenType: response['detail']));
      }
      return right(userModel);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEither<int> sign(
    String nickname,
    String email,
    String password,
  ) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/users');
      final request = http.MultipartRequest("POST", url)
        ..fields['nickname'] = nickname
        ..fields['email'] = email
        ..fields['password'] = password
        ..fields['name_search'] = 1.toString()
        ..fields['unknown_q'] = 1.toString()
        ..fields['proposal'] = 1.toString()
        ..fields['notice_alram'] = 1.toString()
        ..fields['question_alram'] = 1.toString()
        ..fields['answer_alram'] = 1.toString()
        ..fields['comment_alram'] = 1.toString()
        ..fields['p_comment_alram'] = 1.toString();

      final response = await request.send();

      print(request.fields);
      print(response.statusCode);
      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEitherVoid logout() async {
    try {
      await http.delete(
        Uri.parse('http://topping.io:8855/API/users/logout'),
        headers: {
          "accept": "application/json",
        },
      );
      return right(null);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
