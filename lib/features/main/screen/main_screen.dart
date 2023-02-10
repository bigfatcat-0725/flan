import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTapController = useTabController(initialLength: 4);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      // body: ref.watch(feedProivder(3)).when(
      //       data: (data) {
      //         final List<Question> list = data.finQuestion!;
      //
      //         return list.isEmpty
      //             ? Center(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         // search 페이지로 이동.
      //                         ref.read(bottomNavProvier.notifier).onChange(2);
      //                       },
      //                       child: Container(
      //                         width: 100.w,
      //                         height: 30.h,
      //                         decoration: BoxDecoration(
      //                           color: AppColor.primaryColor,
      //                           borderRadius: BorderRadius.circular(100),
      //                         ),
      //                         child: Center(
      //                           child: Text(
      //                             '친구찾기',
      //                             style: AppTextStyle.defaultTextStyle.copyWith(
      //                               fontSize: 11.sp,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(height: 10.h),
      //                     Text(
      //                       '익명으로 자유롭게 질문해보세요!',
      //                       style: AppTextStyle.hintStyle,
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             : Column(
      //                 children: [
      //                   Expanded(
      //                     child: ListView.builder(
      //                       // physics: const ClampingScrollPhysics(),
      //                       itemCount: list.length,
      //                       itemBuilder: (context, index) {
      //                         final cardData = list[index];
      //                         return MainCard(data: cardData);
      //                       },
      //                     ),
      //                   ),
      //                 ],
      //               );
      //       },
      //       error: (error, stackTrace) => Center(
      //         child: Text(error.toString()),
      //       ),
      //       loading: () => Center(
      //         child: CircularProgressIndicator(
      //           color: AppColor.primaryColor,
      //         ),
      //       ),
      //     ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 50.h,
              color: AppColor.hintColor,
              child: Center(
                child: Text(
                  '광고',
                  style: AppTextStyle.defaultTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '인기게시물',
                  style: AppTextStyle.boldTextStyle.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    controller: homeTapController,
                    labelStyle: AppTextStyle.boldTextStyle,
                    unselectedLabelColor: AppColor.hintColor,
                    labelColor: AppColor.textColor,
                    indicatorColor: AppColor.primaryColor,
                    tabs: const [
                      Tab(
                        text: '일',
                      ),
                      Tab(
                        text: '월',
                      ),
                      Tab(
                        text: '주',
                      ),
                      Tab(
                        text: '년',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: homeTapController,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 10,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 10,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 10,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 3,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
