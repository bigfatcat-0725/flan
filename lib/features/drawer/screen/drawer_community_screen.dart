import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/community/widget/detail_comment_card.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/features/drawer/widget/drawer_community_card.dart';
import 'package:flan/models/page/page_model.dart';
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
                      ListView.builder(
                        itemCount: 0,
                        itemBuilder: (context, index) {
                          return Container();
                        },
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
