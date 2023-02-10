import 'package:flan/constants/constants.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/page/page_model.dart';
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
                      ListView.builder(
                        // physics: const ClampingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const MainCard(data: Question());
                        },
                      ),
                      ListView.builder(
                        // physics: const ClampingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return const CommunityCard(
                            item: PageModel(
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
