import 'dart:convert';

import 'package:flan/apis/feed_api.dart';
import 'package:flan/apis/page_api.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final mainControllerProvider =
    StateNotifierProvider<MainController, bool>((ref) {
  return MainController(
    pageAPI: ref.watch(pageAPIProvider),
    feedAPI: ref.watch(feedAPIProvider),
  );
});

final hotPageProvider = FutureProvider.family.autoDispose((ref, String type) {
  final mainController = ref.watch(mainControllerProvider.notifier);
  return mainController.getHotPage(type);
});

final homeFeedProvider = FutureProvider.family.autoDispose((ref, int seq) {
  final mainController = ref.watch(mainControllerProvider.notifier);
  return mainController.getHomeFeed(seq);
});

class MainController extends StateNotifier<bool> {
  final PageAPI _pageAPI;
  final FeedAPI _feedAPI;

  MainController({
    required PageAPI pageAPI,
    required FeedAPI feedAPI,
  })  : _pageAPI = pageAPI,
        _feedAPI = feedAPI,
        super(false);

  Future<List<PageModel>> getHotPage(String type) async {
    List<PageModel> pageList = [];
    final res = await _pageAPI.getHotPage(type: type);
    pageList = [...res.map((e) => PageModel.fromJson(e)).toList()];
    return pageList;
  }

  Future<List> getHomeFeed(int seq) async {
    final res = await _feedAPI.getHomeFeed(seq);
    return res;
  }

  getFeedDetail(int seq) async {
    final url = Uri.parse('http://topping.io:8855/API/questions/one/$seq');
    final res = await http.get(url, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
    });
    final decodeData = utf8.decode(res.bodyBytes);
    final response = jsonDecode(decodeData);
  }

  getFeedAnswerDetail(int seq) async {
    final url = Uri.parse('http://topping.io:8855/API/questions/one/$seq');
    final res = await http.get(url, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
    });
    final decodeData = utf8.decode(res.bodyBytes);
    final response = jsonDecode(decodeData);
  }
}
