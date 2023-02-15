import 'dart:convert';

import 'package:flan/apis/user_api.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final searchControllerProvider =
    StateNotifierProvider<SearchController, bool>((ref) {
  return SearchController(
    userAPI: ref.watch(userAPIProvider),
  );
});

class SearchController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  SearchController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  Future<List<UserInfo>> searchUser({required user, required search}) async {
    state = true;
    final res = await _userAPI.searchUser(user: user, search: search);
    state = false;
    // model 화
    final list = res.map((e) => UserInfo.fromJson(e)).toList();
    return list;
  }

  Future<List> recommendUser({required int seq, required String number}) async {
    try {
      final url = Uri.parse(
          'http://topping.io:8855/API/users/recommender/follow/$seq?phone_number=$number');
      final data = await http.get(
        url,
        headers: {
          "accept": "application/json",
        },
      );
      final decodeData = utf8.decode(data.bodyBytes);
      final response = jsonDecode(decodeData);
      var list = response.map((e) => UserInfo.fromJson(e)).toList();
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}
