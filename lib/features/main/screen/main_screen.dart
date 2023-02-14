import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/main/controller/main_controller.dart';
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
    final isMounted = useIsMounted();

    useEffect(() {
      // 일단 refresh 걸어놓기.
      if (isMounted()) {
        ref.refresh(hotPageProvider('d'));
        ref.refresh(hotPageProvider('w'));
        ref.refresh(hotPageProvider('m'));
        ref.refresh(hotPageProvider('y'));
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Top 3',
                  style: AppTextStyle.boldTextStyle.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                // Image.asset(
                //   'assets/hot.gif',
                //   width: 15.w,
                //   height: 15.w,
                //   fit: BoxFit.cover,
                // ),
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
                        text: 'Today',
                      ),
                      Tab(
                        text: 'Week',
                      ),
                      Tab(
                        text: 'Month',
                      ),
                      Tab(
                        text: 'Year',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: homeTapController,
                      children: [
                        ref.watch(hotPageProvider('d')).when(
                              data: (data) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return CommunityCard(
                                          item: data[index], index: index);
                                    },
                                  ),
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
                        ref.watch(hotPageProvider('w')).when(
                              data: (data) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return CommunityCard(
                                          item: data[index], index: index);
                                    },
                                  ),
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
                        ref.watch(hotPageProvider('m')).when(
                              data: (data) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return CommunityCard(
                                          item: data[index], index: index);
                                    },
                                  ),
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
                        ref.watch(hotPageProvider('y')).when(
                              data: (data) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return CommunityCard(
                                          item: data[index], index: index);
                                    },
                                  ),
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
      ),
    );
  }
}
