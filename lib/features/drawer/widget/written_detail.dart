import 'package:flan/constants/assets_constants.dart';
import 'package:flan/constants/ui_constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/drawer/widget/drawer_comment_card.dart';
import 'package:flan/features/drawer/widget/written_comment_card.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WrittenDetail extends HookConsumerWidget {
  final int page;
  const WrittenDetail({
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvier);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '상세보기'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          ref.watch(onePageProvider(page)).when(
                data: (page) {
                  print(page);
                  final List<String> contentImgList =
                      (page.pages!.photo != null && page.pages!.photo != "")
                          ? page.pages!.photo.toString().split(',')
                          : [];
                  final tagList = page.pages!.tag!.split(',');

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2.5,
                          color: Color(0xffcccccc),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  SvgPicture.asset(
                                    AssetsConstants.community,
                                    width: 17.5.w,
                                    height: 17.5.w,
                                    color: AppColor.primaryColor,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    userInfo!.userInfo!.nickname.toString(),
                                    style:
                                        AppTextStyle.defaultTextStyle.copyWith(
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
                        if (contentImgList.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    contentImgList.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            context.push('/photo', extra: {
                                              'img':
                                                  'http://topping.io:8855${contentImgList[index]}'
                                            });
                                          },
                                          child: Container(
                                            width: 1.sw,
                                            height: 140.h,
                                            margin: EdgeInsets.only(
                                              right: contentImgList[
                                                          contentImgList
                                                                  .length -
                                                              1] ==
                                                      contentImgList[index]
                                                  ? 0.w
                                                  : 10.w,
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'http://topping.io:8855${contentImgList[index]}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                          ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Wrap(
                            children: List.generate(
                              tagList.length,
                              (index) {
                                if (tagList[index] == '') {
                                  return Container();
                                } else {
                                  return GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(currentCategoryProvier.notifier)
                                          .onChange(tagList[index].toString());
                                      context.push('/category');
                                    },
                                    child: Text(
                                      '#${tagList[index]}',
                                      style: AppTextStyle.hintStyle,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
          SizedBox(height: 10.h),
          ref.watch(commentProvider(page)).when(
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
                                      child: WrittenCommentCard(
                                          page: page, comment: comment),
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
                loading: () => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 50.h,
        child: GestureDetector(
          onTap: () {
            context.push('/written_ask', extra: {'page': page});
          },
          child: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw / 2,
                      height: 40.h,
                      color: Colors.white,
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
      ),
    );
  }
}
