// 1. 상태메시지 변경

import 'dart:convert';
import 'dart:io';

import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final userAPIProvider = Provider((ref) {
  return UserAPI();
});

class UserAPI {
  FutureEither<UserModel> changeMemo({
    required UserModel userModel,
    required String memo,
  }) async {
    try {
      final userInfo = userModel.userInfo!;

      final url = Uri.parse('http://topping.io:8855/API/users/${userInfo.seq}');

      final request = http.MultipartRequest("PUT", url)
        ..fields['email'] = userInfo.email.toString()
        ..fields['password'] = userInfo.password.toString()
        ..fields['nickname'] = userInfo.nickname.toString()
        ..fields['photo'] = userInfo.photo.toString()
        ..fields['phone_number'] = userInfo.phoneNumber.toString()
        ..fields['address'] = userInfo.address.toString()
        ..fields['memo'] = memo;

      final response = await request.send();
      final response2 = await response.stream.bytesToString();
      final data = userModel.copyWith(
          userInfo: UserInfo.fromJson(jsonDecode(response2)));

      return right(data);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEither<UserModel> changeName({
    required UserModel userModel,
    required String name,
  }) async {
    try {
      final userInfo = userModel.userInfo!;

      final url = Uri.parse('http://topping.io:8855/API/users/${userInfo.seq}');

      final request = http.MultipartRequest("PUT", url)
        ..fields['email'] = userInfo.email.toString()
        ..fields['password'] = userInfo.password.toString()
        ..fields['nickname'] = name.toString()
        ..fields['photo'] = userInfo.photo.toString()
        ..fields['phone_number'] = userInfo.phoneNumber.toString()
        ..fields['address'] = userInfo.address.toString()
        ..fields['memo'] = userInfo.memo.toString();

      final response = await request.send();
      final response2 = await response.stream.bytesToString();
      final data = userModel.copyWith(
          userInfo: UserInfo.fromJson(jsonDecode(response2)));

      return right(data);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEither<UserModel> changePhoto({
    required UserModel userModel,
    required File photo,
  }) async {
    try {
      final userInfo = userModel.userInfo!;

      final url = Uri.parse('http://topping.io:8855/API/users/${userInfo.seq}');

      final request = http.MultipartRequest("PUT", url)
        ..fields['email'] = userInfo.email.toString()
        ..fields['password'] = userInfo.password.toString()
        ..fields['nickname'] = userInfo.nickname.toString()
        ..fields['photo'] = userInfo.photo.toString()
        ..fields['phone_number'] = userInfo.phoneNumber.toString()
        ..fields['address'] = userInfo.address.toString()
        ..fields['memo'] = userInfo.memo.toString();

      request.files.add(await http.MultipartFile.fromPath('img', photo.path));

      final response = await request.send();
      // multipart 의 body 는 이렇게
      final response2 = await response.stream.bytesToString();
      final data = userModel.copyWith(
          userInfo: UserInfo.fromJson(jsonDecode(response2)));

      return right(data);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  Future<List> searchUser({required user, required search}) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/users/nickname/search?user_seq=$user&search=$search');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }

  // 추천친구 - searchController 직접
}
