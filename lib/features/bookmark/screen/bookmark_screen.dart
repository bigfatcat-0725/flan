import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/bookmark/widget/bookmark_community_card.dart';
import 'package:flan/features/bookmark/widget/bookmark_feed_card.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkScreen extends HookConsumerWidget {
  const BookmarkScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = useState('question');
    // q, p

    // 본인
    final userInfo = ref.watch(userInfoProvier);

    final tempProfileImg = useState(
        'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/linkagelab/20210521225127146gnfp.jpg');
    final profileDesc = useState('');
    final isFollow = useState(true);
    final tabController = useTabController(initialLength: 2);
    final currentUser = useState(true);

    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '보관함'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  labelStyle: AppTextStyle.boldTextStyle,
                  unselectedLabelColor: AppColor.hintColor,
                  labelColor: AppColor.textColor,
                  indicatorColor: AppColor.primaryColor,
                  tabs: const [
                    Tab(
                      text: '피드',
                    ),
                    Tab(
                      text: '커뮤니티',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ref
                          .watch(bookmarkQuestionProivder(
                              userInfo!.userInfo!.seq as int))
                          .when(
                            data: (data) {
                              return ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  // 아마도 북마크 해놓은 상태 -> 답변 삭제 -> 잘문대기로 이동 -> 북마크에서는 질문 없어서 에러.
                                  if (data[index].questions!.answer!.isEmpty) {
                                    return Container();
                                  } else {
                                    return BookmarkFeedCard(data: data[index]);
                                  }
                                },
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                      ref
                          .watch(bookmarkPageProivder(
                              userInfo.userInfo!.seq as int))
                          .when(
                            data: (data) {
                              return ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return BookmarkCommunityCard(
                                    item: data[index],
                                  );
                                },
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            loading: () => Center(
                              child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
