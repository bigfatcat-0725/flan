import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final categoryAPIProvider = Provider((ref) {
  return CategoryAPI();
});

class CategoryAPI {
  Future<List> getCategory() async {
    final url = Uri.parse('http://topping.io:8855/API/category');
    final data = await http.get(url, headers: {
      "accept": "application/json",
    });
    final decodeData = utf8.decode(data.bodyBytes);
    final response = jsonDecode(decodeData);
    return response;
  }
}
