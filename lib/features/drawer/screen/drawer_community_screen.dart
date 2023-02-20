import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/features/drawer/widget/drawer_comment_card.dart';
import 'package:flan/features/drawer/widget/drawer_community_card.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerCommunityScreen extends HookConsumerWidget {
  const DrawerCommunityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final userInfo = ref.watch(userInfoProvier);

    useEffect(() {
      Future.microtask(() {
        ref
            .read(communityControllerProvider.notifier)
            .getMyComment(userInfo!.userInfo!.seq as int);
      });
    });

    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '커뮤니티 관리'),
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
                      text: '내가 쓴 글',
                    ),
                    Tab(
                      text: '내가 쓴 댓글',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ref
                          .watch(
                              writtenProvider(userInfo!.userInfo!.seq as int))
                          .when(
                            data: (data) {
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return DrawerCommunityCard(
                                    item: data[index],
                                  );
                                },
                              );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            loading: () => const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                      ref
                          .watch(
                              commentMyProvider(userInfo.userInfo!.seq as int))
                          .when(
                            data: (data) {
                              return data.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Text(
                                        '답변이 없어요.',
                                        style: AppTextStyle.hintStyle,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        final comment = data[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w),
                                          child: DrawerCommentCard(
                                              page: comment.pageSeq as int,
                                              comment: comment),
                                        );
                                      },
                                    );
                            },
                            error: (error, stackTrace) => Center(
                              child: Text(error.toString()),
                            ),
                            loading: () => const Center(
                              child: CupertinoActivityIndicator(),
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
