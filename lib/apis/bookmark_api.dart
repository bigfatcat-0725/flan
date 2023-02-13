import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final bookmarkAPIProvider = Provider((ref) {
  return BookmarkAPI();
});

class BookmarkAPI {
  Future<int> isBookmark({
    required int userSeq,
    required int seq,
    required String type,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/bookmark/bookmark/log?user_seq=$userSeq&seq=$seq&bm_type=$type');
    final request = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    return int.parse(request.body);
  }

  Future<int> pageBookmarking({
    required int user,
    required int page,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/pages/bookmark/update/$page?user_seq=$user');
    final request = await http.put(
      url,
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    return request.statusCode;
  }

  Future<int> questionBookmarking({
    required int user,
    required int question,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/questions/bookmark/update/$question?user_seq=$user');
    final request = await http.put(
      url,
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    return request.statusCode;
  }

  Future<List> getBookmark({
    required int seq,
    required String type,
  }) async {
    final url =
        Uri.parse('http://topping.io:8855/API/bookmark/$seq?bm_type=$type');
    final request = await http.get(
      url,
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    final decodeData = utf8.decode(request.bodyBytes);
    final response = jsonDecode(decodeData);

    return response;
  }
}
