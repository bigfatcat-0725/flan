import 'dart:convert';

import 'package:flan/core/failure.dart';
import 'package:flan/core/type_defs.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final feedAPIProvider = Provider((ref) {
  return FeedAPI();
});

class FeedAPI {
  Future<FeedModel> getFeed(seq) async {
    final url = Uri.parse('http://topping.io:8855/API/feed/main/$seq');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    final feedModel = FeedModel.fromJson(response as Map<String, dynamic>);
    return feedModel;
  }
}
