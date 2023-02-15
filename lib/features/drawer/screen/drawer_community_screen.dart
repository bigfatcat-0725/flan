import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/community/widget/detail_comment_card.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/features/drawer/widget/drawer_community_card.dart';
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
    final writtenPage = useState([]);
    final writtenComment = useState([]);
    final userInfo = ref.watch(userInfoProvier);

    useEffect(() {
      if (context.mounted) {
        Future.microtask(() async {
          writtenPage.value = await ref
              .watch(drawerControllerProvider.notifier)
              .writtenPage(userInfo!.userInfo!.seq as int);
        });
      }
      return null;
    }, []);

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
                        itemCount: writtenPage.value.length,
                        itemBuilder: (context, index) {
                          return DrawerCommunityCard(
                            item: writtenPage.value[index],
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
