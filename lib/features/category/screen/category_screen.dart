import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/category/controller/category_controller.dart';
import 'package:flan/models/category/category_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryScreen extends HookConsumerWidget {
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = useState(<CategoryModel>[]);
    final currentCategory = ref.watch(currentCategoryProvier);
    final allPageCnt = useState(0);

    useEffect(() {
      if (context.mounted) {
        Future.microtask(() async {
          final res =
              await ref.read(categoryControllerProvider.notifier).getCategory();
          categoryList.value = res;

          for (final category in categoryList.value) {
            allPageCnt.value += category.pageCnt!;
          }

          print(allPageCnt.value);
        });
      }
      return null;
    }, [categoryList]);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '카테고리'),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemCount: categoryList.value.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    // 전역으로 카테고리 유지
                    ref
                        .read(currentCategoryProvier.notifier)
                        .onChange(categoryList.value[index].title!);
                    ref
                        .read(currentCategorySeqProvier.notifier)
                        .onChange(categoryList.value[index].seq!);
                    context.pop();
                  },
                  tileColor: currentCategory == categoryList.value[index].title
                      ? Colors.white
                      : null,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.5.h,
                  ),
                  shape: Border(
                    bottom: BorderSide(
                      width: 0.25.w,
                      color: AppColor.hintColor,
                    ),
                    top: index == 0
                        ? BorderSide(
                            width: 0.25.w,
                            color: AppColor.hintColor,
                          )
                        : const BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            categoryList.value[index].title.toString(),
                            style: AppTextStyle.boldTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          categoryList.value[index].title == '전체'
                              ? allPageCnt.value.toString()
                              : categoryList.value[index].pageCnt.toString(),
                          style: AppTextStyle.greyStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
