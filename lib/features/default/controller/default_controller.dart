// 여기에서 피드 관리

import 'dart:convert';

import 'package:flan/apis/feed_api.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final defaultControllerProvider =
    StateNotifierProvider<DefaultController, bool>((ref) {
  return DefaultController(
    feedAPI: ref.watch(feedAPIProvider),
  );
});

final feedProivder = FutureProvider.family.autoDispose((ref, int seq) {
  final defaultController = ref.watch(defaultControllerProvider.notifier);
  return defaultController.getFeed(seq);
});

class DefaultController extends StateNotifier<bool> {
  final FeedAPI _feedAPI;
  DefaultController({
    required FeedAPI feedAPI,
  })  : _feedAPI = feedAPI,
        super(false);
  Future<FeedModel> getFeed(int seq) async {
    final res = await _feedAPI.getFeed(seq);
    return res;
  }

  void report({
    required String type,
    required int user,
    required int seq,
    required String report,
  }) async {
    final url = Uri.parse('http://topping.io:8855/API/reports');
    final body = jsonEncode({
      "user_seq": user,
      "question_seq": type == 'q' ? seq : 0,
      "answer_seq": type == 'a' ? seq : 0,
      "page_seq": type == 'p' ? seq : 0,
      "comment_seq": type == 'c' ? seq : 0,
      "report_type": report,
      "content": ""
    });
    final res = await http.post(url, body: body, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
    });
    final decodeData = utf8.decode(res.bodyBytes);
    final response = jsonDecode(decodeData);
  }
}
