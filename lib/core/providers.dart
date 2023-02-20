// riverpod example
// final counterProvider = StateNotifierProvider<Counter, int>((ref) {
//   return Counter();
// });
//
// class Counter extends StateNotifier<int> {
//   Counter() : super(0);
//   void increment() => state++;
// }

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fcmTokenProvider = StateNotifierProvider<FcmToken, String>((ref) {
  return FcmToken();
});

class FcmToken extends StateNotifier<String> {
  FcmToken() : super('');
  void onChange(String name) => state = name;
}

final bottomNavProvier = StateNotifierProvider<BottomNav, int>((ref) {
  return BottomNav();
});

class BottomNav extends StateNotifier<int> {
  BottomNav() : super(0);
  void onChange(int index) => state = index;
}

final feedSeqProvider = StateNotifierProvider<FeedSeq, int>((ref) {
  return FeedSeq();
});

class FeedSeq extends StateNotifier<int> {
  FeedSeq() : super(0);
  // 0 이면 유저정보 값으로 본인 프로필로 이동하고
  // 프로필 사진 클릭으로 값을 업데이트 한다면 그 값으로 프로필 이동하면 완료.
  void onChange(int index) => state = index;
}

final feedNameProvider = StateNotifierProvider<FeedName, String>((ref) {
  return FeedName();
});

class FeedName extends StateNotifier<String> {
  FeedName() : super('');
  void onChange(String name) => state = name;
}

final currentCategoryProvier =
    StateNotifierProvider<CurrentCategory, String>((ref) {
  return CurrentCategory();
});

class CurrentCategory extends StateNotifier<String> {
  CurrentCategory() : super('전체');
  void onChange(String title) => state = title;
}

final currentCategorySeqProvier =
    StateNotifierProvider<CurrentCategorySeq, int>((ref) {
  return CurrentCategorySeq();
});

class CurrentCategorySeq extends StateNotifier<int> {
  CurrentCategorySeq() : super(0);
  void onChange(int seq) => state = seq;
}
