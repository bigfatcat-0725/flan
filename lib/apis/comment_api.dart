import 'dart:convert';
import 'dart:io';

import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final commentAPIProvider = Provider((ref) {
  return CommentAPI();
});

class CommentAPI {
  Future<List> getComment(seq) async {
    final url =
        Uri.parse('http://topping.io:8855/API/comment/page/all/comment/$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }

  Future<List> getMyComment(seq) async {
    final url = Uri.parse('http://topping.io:8855/API/comment/my_comment/$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);

    return response;
  }

  FutureEither<int> postComment(
    List<File> imgList, {
    required int user,
    required int page,
    required String reply,
  }) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/comment');

      final request = http.MultipartRequest("POST", url)
        ..fields['user_seq'] = user.toString()
        ..fields['page_seq'] = page.toString()
        ..fields['reply'] = reply.toString();
      if (imgList.isNotEmpty) {
        for (var file in imgList) {
          request.files
              .add(await http.MultipartFile.fromPath('img', file.path));
        }
      }

      final response = await request.send();
      // print(response.statusCode);
      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  FutureEither<int> editComment(
    List<File> imgList, {
    required int user,
    required int commentSeq,
    required String reply,
  }) async {
    try {
      final url = Uri.parse('http://topping.io:8855/API/comment/$commentSeq');

      final request = http.MultipartRequest("PUT", url)
        ..fields['reply'] = reply.toString();

      if (imgList.isNotEmpty) {
        for (var file in imgList) {
          request.files
              .add(await http.MultipartFile.fromPath('img', file.path));
        }
      }

      final response = await request.send();

      return right(response.statusCode);
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  Future<int> deleteComment({
    required int seq,
  }) async {
    final url = Uri.parse('http://topping.io:8855/API/comment/$seq');
    final request = await http.delete(
      url,
      headers: {
        "accept": "application/json",
      },
    );
    // 1, 0
    return int.parse(request.body);
  }
}
