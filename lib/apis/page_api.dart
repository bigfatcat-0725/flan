import 'dart:convert';

import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final pageAPIProvider = Provider((ref) {
  return PageAPI();
});

class PageAPI {
  Future<List> getPage(seq) async {
    final url = Uri.parse('http://topping.io:8855/API/pages');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }

  FutureEither<int> postPage({
    required int user,
    required int theme,
    required String title,
    required String content,
    required String private,
  }) async {
    try {
      // status 1 공개 0 익명
      final url = Uri.parse('http://topping.io:8855/API/pages');

      final request = http.MultipartRequest("POST", url)
        ..fields['user_seq'] = user.toString()
        ..fields['theme_seq'] = theme.toString()
        ..fields['title'] = title.toString()
        ..fields['content'] = content.toString()
        ..fields['private'] = private.toString()
        ..fields['status'] = '1'.toString();

      final response = await request.send();
      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
