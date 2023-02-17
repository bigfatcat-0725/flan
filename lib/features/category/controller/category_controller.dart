import 'package:flan/apis/category_api.dart';
import 'package:flan/models/category/category_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, bool>((ref) {
  return CategoryController(
    categoryAPI: ref.watch(categoryAPIProvider),
  );
});

final categoryProivder = FutureProvider.autoDispose((ref) {
  final categoryController = ref.watch(categoryControllerProvider.notifier);
  return categoryController.getCategory();
});

class CategoryController extends StateNotifier<bool> {
  final CategoryAPI _categoryAPI;
  CategoryController({
    required CategoryAPI categoryAPI,
  })  : _categoryAPI = categoryAPI,
        super(false);

  Future<List<CategoryModel>> getCategory() async {
    final res = await _categoryAPI.getCategory();
    final data = res
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();

    var allCnt = 0;

    for (var i in data) {
      allCnt += i.pageCnt!;
    }
    var all = CategoryModel(
      tag: null,
      likeCnt: null,
      title: 'toàn bộ',
      detail: 'toàn bộ',
      pageCnt: allCnt,
      createdAt: null,
      seq: 0,
      photo: null,
    );

    return [all, ...data];
  }
}
