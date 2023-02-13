import 'package:flan/main.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // admob
    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.mediumRectangle,
      adUnitId: unitID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: const AdRequest(),
    )..load();
    //

    final homeTapController = useTabController(initialLength: 3);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              width: AdSize.mediumRectangle.width.toDouble(),
              height: AdSize.mediumRectangle.height.toDouble(),
              color: AppColor.hintColor.withOpacity(0.1),
              child: AdWidget(
                ad: banner,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/hot.gif',
                  width: 15.w,
                  height: 15.w,
                  fit: BoxFit.cover,
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
                              // return const CommunityCard(
                              //   item: PageModel(
                              //     users: Users(
                              //         email: 'test@gmail.com',
                              //         auth: '',
                              //         followingCnt: 0,
                              //         password:
                              //             'ef51306214d9a6361ee1d5b452e6d2bb70dc7ebb85bf9e02c3d4747fb57d6bec',
                              //         createdAt: '2023-01-16T16:04:32',
                              //         snsId: '',
                              //         nickname: '짱짱맨',
                              //         updatedAt: null,
                              //         snsType: '',
                              //         photo: '',
                              //         deletedAt: null,
                              //         status: '1',
                              //         phoneNumber: '',
                              //         lastLogin: '2023-02-08T14:59:22',
                              //         emailVerifiedAt: null,
                              //         address: null,
                              //         rememberToken: 'test',
                              //         memo: '',
                              //         seq: 3,
                              //         userLevel: 1,
                              //         followCnt: 0),
                              //     pages: Pages(
                              //       updatedAt: null,
                              //       userSeq: 3,
                              //       title: '자유에다가 글쓰기',
                              //       photo: '',
                              //       tag: '',
                              //       status: '1',
                              //       seq: 1,
                              //       createdAt: '2023-02-08T14:31:13',
                              //       themeSeq: 1,
                              //       content: '하이하이',
                              //       likes: 0,
                              //       viewCnt: 1,
                              //       commentCnt: 1,
                              //       remaining: '28분 전',
                              //     ),
                              //   ),
                              // );
                              return Container();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              // return const CommunityCard(
                              //   item: PageModel(
                              //     users: Users(
                              //         email: 'test@gmail.com',
                              //         auth: '',
                              //         followingCnt: 0,
                              //         password:
                              //             'ef51306214d9a6361ee1d5b452e6d2bb70dc7ebb85bf9e02c3d4747fb57d6bec',
                              //         createdAt: '2023-01-16T16:04:32',
                              //         snsId: '',
                              //         nickname: '짱짱맨',
                              //         updatedAt: null,
                              //         snsType: '',
                              //         photo: '',
                              //         deletedAt: null,
                              //         status: '1',
                              //         phoneNumber: '',
                              //         lastLogin: '2023-02-08T14:59:22',
                              //         emailVerifiedAt: null,
                              //         address: null,
                              //         rememberToken: 'test',
                              //         memo: '',
                              //         seq: 3,
                              //         userLevel: 1,
                              //         followCnt: 0),
                              //     pages: Pages(
                              //       updatedAt: null,
                              //       userSeq: 3,
                              //       title: '자유에다가 글쓰기',
                              //       photo: '',
                              //       tag: '',
                              //       status: '1',
                              //       seq: 1,
                              //       createdAt: '2023-02-08T14:31:13',
                              //       themeSeq: 1,
                              //       content: '하이하이',
                              //       likes: 0,
                              //       viewCnt: 1,
                              //       commentCnt: 1,
                              //       remaining: '28분 전',
                              //     ),
                              //   ),
                              // );
                              return Container();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              // return const CommunityCard(
                              //   item: PageModel(
                              //     users: Users(
                              //         email: 'test@gmail.com',
                              //         auth: '',
                              //         followingCnt: 0,
                              //         password:
                              //             'ef51306214d9a6361ee1d5b452e6d2bb70dc7ebb85bf9e02c3d4747fb57d6bec',
                              //         createdAt: '2023-01-16T16:04:32',
                              //         snsId: '',
                              //         nickname: '짱짱맨',
                              //         updatedAt: null,
                              //         snsType: '',
                              //         photo: '',
                              //         deletedAt: null,
                              //         status: '1',
                              //         phoneNumber: '',
                              //         lastLogin: '2023-02-08T14:59:22',
                              //         emailVerifiedAt: null,
                              //         address: null,
                              //         rememberToken: 'test',
                              //         memo: '',
                              //         seq: 3,
                              //         userLevel: 1,
                              //         followCnt: 0),
                              //     pages: Pages(
                              //       updatedAt: null,
                              //       userSeq: 3,
                              //       title: '자유에다가 글쓰기',
                              //       photo: '',
                              //       tag: '',
                              //       status: '1',
                              //       seq: 1,
                              //       createdAt: '2023-02-08T14:31:13',
                              //       themeSeq: 1,
                              //       content: '하이하이',
                              //       likes: 0,
                              //       viewCnt: 1,
                              //       commentCnt: 1,
                              //       remaining: '28분 전',
                              //     ),
                              //   ),
                              // );
                              return Container();
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
