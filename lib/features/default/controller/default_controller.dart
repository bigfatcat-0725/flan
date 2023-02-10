// 여기에서 피드 관리

import 'package:flan/apis/feed_api.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final defaultControllerProvider =
    StateNotifierProvider<DefaultController, bool>((ref) {
  return DefaultController(
    feedAPI: ref.watch(feedAPIProvider),
  );
});

final feedProivder = FutureProvider.family((ref, int seq) {
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
}
