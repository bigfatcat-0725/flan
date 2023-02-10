import 'package:flan/core/core.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunityScreen extends HookConsumerWidget {
  const CommunityScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final currentCategory = ref.watch(currentCategoryProvier);
    final currentCategorySeq = ref.watch(currentCategorySeqProvier);
    final filter = useState(0);
    final isLoading = ref.watch(communityControllerProvider);
    final pageList = useState(<PageModel>[]);

    useEffect(() {
      if (isMounted()) {
        Future.microtask(() async {
          final list =
              await ref.read(communityControllerProvider.notifier).getPage(0);
          pageList.value = [...list];
        });
      }
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '익명으로 자유롭게 질문해보세요!',
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
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              '질문하기',
                              style: AppTextStyle.defaultTextStyle.copyWith(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          filter.value = 0;
                        },
                        child: Text(
                          '최신순',
                          style: filter.value == 0
                              ? AppTextStyle.boldTextStyle.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: 13.sp,
                                )
                              : AppTextStyle.hintStyle.copyWith(
                                  fontSize: 13.sp,
                                ),
                        ),
                      ),
                      Text(
                        ' | ',
                        style: AppTextStyle.hintStyle.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter.value = 1;
                        },
                        child: Text(
                          '인기순',
                          style: filter.value == 1
                              ? AppTextStyle.boldTextStyle.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: 13.sp,
                                )
                              : AppTextStyle.hintStyle.copyWith(
                                  fontSize: 13.sp,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: pageList.value.length,
                    itemBuilder: (context, index) {
                      return CommunityCard(
                        item: pageList.value[index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
