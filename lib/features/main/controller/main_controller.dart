import 'package:flan/apis/page_api.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainControllerProvider =
    StateNotifierProvider<MainController, bool>((ref) {
  return MainController(
    pageAPI: ref.watch(pageAPIProvider),
  );
});

final hotPageProvider = FutureProvider.family.autoDispose((ref, String type) {
  final mainController = ref.watch(mainControllerProvider.notifier);
  return mainController.getHotPage(type);
});

class MainController extends StateNotifier<bool> {
  final PageAPI _pageAPI;
  MainController({
    required PageAPI pageAPI,
  })  : _pageAPI = pageAPI,
        super(false);

  Future<List<PageModel>> getHotPage(String type) async {
    List<PageModel> pageList = [];
    final res = await _pageAPI.getHotPage(type: type);
    pageList = [...res.map((e) => PageModel.fromJson(e)).toList()];
    return pageList;
  }
}
