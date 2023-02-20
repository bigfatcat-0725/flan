import 'package:flan/constants/assets_constants.dart';
import 'package:flan/constants/constants.dart';
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

class CategoryScreen extends HookConsumerWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCategory = ref.watch(currentCategoryProvier);

    final page = useState(<PageModel>[]);

    useEffect(() {
      final currentTap = ref.watch(bottomNavProvier);

      if (context.mounted && currentTap == 1) {
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
      appBar: UIConstants.qaAppBar(context, '#$currentCategory'),
      body: Column(
        children: [
          ref.watch(themePageProvider(currentCategory)).when(
                data: (pageList) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    ),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              )
        ],
      ),
    );
  }
}
