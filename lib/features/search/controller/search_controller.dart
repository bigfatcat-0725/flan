import 'package:flan/apis/user_api.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchController, bool>((ref) {
  return SearchController(
    userAPI: ref.watch(userAPIProvider),
  );
});

class SearchController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  SearchController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  Future<List<UserInfo>> searchUser({required user, required search}) async {
    state = true;
    final res = await _userAPI.searchUser(user: user, search: search);
    state = false;
    // model 화
    final list = res.map((e) => UserInfo.fromJson(e)).toList();
    return list;
  }
}
