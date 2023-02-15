import 'package:flan/apis/bookmark_api.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart';
import 'package:flan/models/bookmark/bookmark_question_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarkQuestionProivder =
    FutureProvider.family.autoDispose((ref, int user) {
  final categoryController = ref.watch(bookmarkControllerProvider.notifier);
  return categoryController.getBookmarkQuestion(user: user);
});
final bookmarkPageProivder = FutureProvider.family.autoDispose((ref, int user) {
  final categoryController = ref.watch(bookmarkControllerProvider.notifier);
  return categoryController.getBookmarkPage(user: user);
});

final bookmarkControllerProvider =
    StateNotifierProvider<BookmarkController, bool>((ref) {
  return BookmarkController(
    bookmarkAPI: ref.watch(bookmarkAPIProvider),
  );
});

class BookmarkController extends StateNotifier<bool> {
  final BookmarkAPI _bookmarkAPI;
  BookmarkController({
    required BookmarkAPI bookmarkAPI,
  })  : _bookmarkAPI = bookmarkAPI,
        super(false);

  Future<List<BookmarkPageModel>> getBookmarkPage({
    required int user,
  }) async {
    final res = await _bookmarkAPI.getBookmark(seq: user, type: 'p');
    final list = res.map((e) => BookmarkPageModel.fromJson(e)).toList();
    return list;
  }

  Future<List<BookmarkQuestionModel>> getBookmarkQuestion({
    required int user,
  }) async {
    final res = await _bookmarkAPI.getBookmark(seq: user, type: 'q');
    final list = res.map((e) => BookmarkQuestionModel.fromJson(e)).toList();
    return list;
  }

  Future<int> isBookmarkQuestion({
    required int userSeq,
    required int seq,
  }) async {
    final res = await _bookmarkAPI.isBookmark(
      userSeq: userSeq,
      seq: seq,
      type: 'q',
    );
    return res;
  }

  Future<int> isBookmarkPage({
    required int userSeq,
    required int seq,
  }) async {
    final res = await _bookmarkAPI.isBookmark(
      userSeq: userSeq,
      seq: seq,
      type: 'p',
    );
    return res;
  }
}
