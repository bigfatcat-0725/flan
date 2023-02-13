import 'package:flan/constants/ui_constants.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/community/widget/detail_comment_card.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookMarkCommunityDetailScreen extends HookConsumerWidget {
  final BookmarkPageModel page;
  const BookMarkCommunityDetailScreen({
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communityContoller = ref.watch(communityControllerProvider.notifier);

    useEffect(() {
      Future.microtask(
          () => ref.refresh(commentProvider(page.pages!.seq as int)));
    }, []);

    // 전에서 가져오는게 아니라
    // 새로 api 하나만 들고오는 걸로 바꿔야 함.

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '상세보기'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35.w,
                            height: 17.5.w,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                'Q&A',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            page.pages!.private == 1
                                ? page.users!.nickname.toString()
                                : '익명',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 11.sp,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            page.pages!.remaining.toString(),
                            style: AppTextStyle.hintStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        page.pages!.title.toString(),
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        page.pages!.content.toString(),
                        style: AppTextStyle.defaultTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          ref.watch(commentProvider(page.pages!.seq as int)).when(
                data: (data) {
                  return data.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            '답변이 없어요.',
                            style: AppTextStyle.hintStyle,
                          ),
                        )
                      : Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final comment = data[index];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child:
                                          DetailCommentCard(comment: comment),
                                    );
                                  },
                                ),
                              ),
                            ],
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
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 40.h,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/bookmark_community_ask', extra: {'page': page});
              },
              child: CupertinoTabBar(
                backgroundColor: AppColor.scaffoldBackgroundColor,
                items: [
                  BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 1.sw / 2,
                          height: 40.h,
                          color: AppColor.scaffoldBackgroundColor,
                          padding: EdgeInsets.only(left: 16.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '댓글입력...',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 13.sp,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(),
                        ],
                      ),
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
