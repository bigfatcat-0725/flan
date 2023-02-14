import 'package:flan/constants/constants.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/community/widget/detail_comment_card.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
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
                      ListView.builder(
                        // physics: const ClampingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return CommunityCard(
                            item: const PageModel(
                              users: Users(
                                  email: 'test@gmail.com',
                                  auth: '',
                                  followingCnt: 0,
                                  password:
                                      'ef51306214d9a6361ee1d5b452e6d2bb70dc7ebb85bf9e02c3d4747fb57d6bec',
                                  createdAt: '2023-01-16T16:04:32',
                                  snsId: '',
                                  nickname: '짱짱맨',
                                  updatedAt: null,
                                  snsType: '',
                                  photo: '',
                                  deletedAt: null,
                                  status: '1',
                                  phoneNumber: '',
                                  lastLogin: '2023-02-08T14:59:22',
                                  emailVerifiedAt: null,
                                  address: null,
                                  rememberToken: 'test',
                                  memo: '',
                                  seq: 3,
                                  userLevel: 1,
                                  followCnt: 0),
                              pages: Pages(
                                updatedAt: null,
                                userSeq: 3,
                                title: '자유에다가 글쓰기',
                                photo: '',
                                tag: '',
                                status: '1',
                                seq: 1,
                                createdAt: '2023-02-08T14:31:13',
                                themeSeq: 1,
                                content: '하이하이',
                                likes: 0,
                                viewCnt: 1,
                                commentCnt: 1,
                                remaining: '28분 전',
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        // physics: const ClampingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 4.h,
                            ),
                            // child: const DetailCommentCard(comment: null,),
                            child: Container(),
                          );
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
