import 'dart:convert';

import 'package:flan/apis/category_api.dart';
import 'package:flan/models/category/category_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

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

final hotCategoryProivder = FutureProvider.autoDispose((ref) {
  final categoryController = ref.watch(categoryControllerProvider.notifier);
  return categoryController.getHotCategory();
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
      title: '전체',
      detail: '전체',
      pageCnt: allCnt,
      createdAt: null,
      seq: 0,
      photo: null,
    );

    return [all, ...data];
  }

  Future<List> getHotCategory() async {
    final url = Uri.parse('http://topping.io:8855/API/category/many_page/list');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);

    final res = response
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return res;
  }
}
