import 'package:flan/constants/assets_constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/category/controller/category_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/search/controller/search_controller.dart';
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

class CommunityScreen extends HookConsumerWidget {
  const CommunityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategorySeq = ref.watch(currentCategorySeqProvier);
    final currentCategory = ref.watch(currentCategoryProvier);
    final filter = useState(0);
    final tabController = useTabController(initialLength: 2);
    final searchStatus = useState(false);
    final searchTextController = useTextEditingController();
    final searchResult = useState([]);
    final userInfo = ref.watch(userInfoProvier);

    final page = useState(<PageModel>[]);

    useEffect(() {
      final currentTap = ref.watch(bottomNavProvier);

      if (currentTap == 1 && context.mounted) {
        Future.microtask(() async {
          page.value = await ref
              .watch(communityControllerProvider.notifier)
              .getThemePage(currentCategory);
        });
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            labelStyle: AppTextStyle.boldTextStyle,
            unselectedLabelStyle: AppTextStyle.defaultTextStyle,
            unselectedLabelColor: AppColor.hintColor,
            labelColor: AppColor.textColor,
            indicatorColor: AppColor.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: '전체',
              ),
              Tab(
                text: '태그',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ref.watch(pageProvider).when(
                      data: (pageList) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Vui lòng đặt câu hỏi ẩn danh!',
                                    style: AppTextStyle.greyStyle.copyWith(),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.push('/question', extra: {
                                        'type': 'community',
                                        'toSeq': currentCategorySeq,
                                      });
                                    },
                                    child: Container(
                                      width: 100.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '글쓰기',
                                          style: AppTextStyle.defaultTextStyle
                                              .copyWith(
                                            fontSize: 11.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                            //   child: Row(
                            //     children: [
                            //       GestureDetector(
                            //         onTap: () {
                            //           filter.value = 0;
                            //         },
                            //         child: Text(
                            //           '최신순',
                            //           style: filter.value == 0
                            //               ? AppTextStyle.boldTextStyle.copyWith(
                            //                   color: AppColor.primaryColor,
                            //                   fontSize: 13.sp,
                            //                 )
                            //               : AppTextStyle.hintStyle.copyWith(
                            //                   fontSize: 13.sp,
                            //                 ),
                            //         ),
                            //       ),
                            //       Text(
                            //         ' | ',
                            //         style: AppTextStyle.hintStyle.copyWith(
                            //           fontSize: 13.sp,
                            //         ),
                            //       ),
                            //       GestureDetector(
                            //         onTap: () {
                            //           filter.value = 1;
                            //         },
                            //         child: Text(
                            //           '인기순',
                            //           style: filter.value == 1
                            //               ? AppTextStyle.boldTextStyle.copyWith(
                            //                   color: AppColor.primaryColor,
                            //                   fontSize: 13.sp,
                            //                 )
                            //               : AppTextStyle.hintStyle.copyWith(
                            //                   fontSize: 13.sp,
                            //                 ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 5.h),
                            Expanded(
                              child: ListView.builder(
                                itemCount: pageList.length,
                                itemBuilder: (context, index) {
                                  final item = pageList[index];

                                  return CommunityCard(
                                    // key: UniqueKey(),
                                    item: item,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(error.toString()),
                      ),
                      loading: () => const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
                Column(
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      color: AppColor.scaffoldBackgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                searchStatus.value = true;
                              },
                              child: Container(
                                width: 1.sw,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  onTap: () {
                                    searchStatus.value = true;
                                  },
                                  onChanged: (value) async {
                                    if (searchStatus.value &&
                                        searchTextController.text != '') {
                                      final data = await ref
                                          .read(categoryControllerProvider
                                              .notifier)
                                          .getCategory();

                                      final searchData = data
                                          .where(
                                              (e) => e.title!.contains(value))
                                          .toList();

                                      searchResult.value = [...searchData];
                                      // print(searchResult.value);
                                    } else {
                                      searchResult.value = [];
                                    }
                                  },
                                  controller: searchTextController,
                                  cursorColor: AppColor.primaryColor,
                                  style: AppTextStyle.defaultTextStyle,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIconConstraints: BoxConstraints(
                                        minWidth: 30.w, minHeight: 30.w),
                                    prefixIcon: Container(
                                      padding: EdgeInsets.all(10.w),
                                      child: SvgPicture.asset(
                                        AssetsConstants.search,
                                        width: 15.w,
                                        height: 15.w,
                                        color: AppColor.greyColor,
                                      ),
                                    ),
                                    suffixIconConstraints: BoxConstraints(
                                        minWidth: 30.w, minHeight: 30.w),
                                    suffixIcon: Visibility(
                                      visible: searchStatus.value,
                                      child: GestureDetector(
                                        onTap: () {
                                          searchStatus.value = false;
                                          searchTextController.text = '';
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10.w),
                                          child: SvgPicture.asset(
                                            AssetsConstants.clear,
                                            color: AppColor.primaryColor,
                                            width: 17.5.w,
                                            height: 17.5.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    hintText: '원하시는 태그를 검색해보세요.',
                                    hintStyle: AppTextStyle.hintStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (searchStatus.value)
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              width: 1.sw,
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              margin: EdgeInsets.only(
                                  bottom: 8.h, left: 16.w, right: 16.w),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '#${searchResult.value[index].title}',
                                    style: AppTextStyle.boldTextStyle,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '게시글 ${searchResult.value[index].pageCnt}'),
                                      // SizedBox(width: 10.w),
                                      // SvgPicture.asset(
                                      //   'assets/c_tag_star.svg',
                                      //   width: 15.w,
                                      //   height: 15.w,
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: searchResult.value.length,
                        ),
                      )
                    else
                      ref.watch(hotCategoryProivder).when(
                            data: (data) {
                              return Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '인기태그',
                                          style: AppTextStyle.boldTextStyle
                                              .copyWith(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Expanded(
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                print(data[index]
                                                    .title
                                                    .toString());
                                                ref
                                                    .read(currentCategoryProvier
                                                        .notifier)
                                                    .onChange(data[index]
                                                        .title
                                                        .toString());
                                                context.push('/category');
                                              },
                                              child: Container(
                                                width: 1.sw,
                                                height: 40.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w),
                                                margin: EdgeInsets.only(
                                                    bottom: 8.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      blurRadius: 2.5,
                                                      color: Color(0xffcccccc),
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '#${data[index].title.toString()}',
                                                      style: AppTextStyle
                                                          .boldTextStyle,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            '게시글 ${data[index].pageCnt.toString()}'),
                                                        // SizedBox(width: 10.w),
                                                        // SvgPicture.asset(
                                                        //   'assets/c_tag_star.svg',
                                                        //   width: 15.w,
                                                        //   height: 15.w,
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: data.length,
                                        ),
                                      ),
                                    ],
                                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
