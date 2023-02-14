import 'dart:convert';
import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final pageAPIProvider = Provider((ref) {
  return PageAPI();
});

class PageAPI {
  Future<List> getAllPage() async {
    final url = Uri.parse('http://topping.io:8855/API/pages');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }

  Future<List> getThemePage({required int seq}) async {
    final url =
        Uri.parse('http://topping.io:8855/API/pages/category_page/list$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }

  Future<int> deletePage({
    required int pageSeq,
  }) async {
    final url = Uri.parse('http://topping.io:8855/API/pages/$pageSeq');
    final request = await http.delete(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    return request.statusCode;
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

  Future<int> likePage({
    required int pageSeq,
    required int userSeq,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/pages/like/update/$pageSeq?user_seq=$userSeq');
    final request = await http.put(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    return request.statusCode;
  }

  Future<int> isLikePage({
    required userSeq,
    required pageSeq,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/likes/like/log?user_seq=$userSeq&seq=$pageSeq&like_type=p');
    final request = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    return int.parse(request.body);
  }

  Future<List> getHotPage({
    required String type,
  }) async {
    final url = Uri.parse(
        'http://topping.io:8855/API/pages/top_three/page?d_type=$type');
    final data = await http.get(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);

    return response;
  }
}
