import 'dart:io';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPageScreen extends HookConsumerWidget {
  final int toSeq;
  final PageModel page;
  const EditPageScreen({
    Key? key,
    required this.toSeq,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privateCheck = useState(true);
    final pictures = useState(<File>[]);
    final picturesCurIndex = useState(1);
    final titleTextController = useTextEditingController();
    final questionTextController = useTextEditingController();

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;

    // Theme
    final currentCategory = ref.watch(currentCategoryProvier);
    final cureentCategorySeq = ref.watch(currentCategorySeqProvier);

    useEffect(() {
      privateCheck.value = page.pages?.private == 0 ? true : false;
      titleTextController.text = page.pages!.title.toString();
      questionTextController.text = page.pages!.content.toString();

      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(
        context,
        '게시물 수정',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  privateCheck.value ? '익명' : '닉네임',
                  style: AppTextStyle.boldTextStyle,
                ),
                SizedBox(width: 5.w),
                CupertinoSwitch(
                  activeColor: AppColor.primaryColor,
                  value: privateCheck.value,
                  onChanged: (value) {
                    privateCheck.value = !privateCheck.value;
                  },
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                Text(
                  '현재 카테고리 : $currentCategory',
                  style: AppTextStyle.boldTextStyle.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: titleTextController,
                  cursorColor: AppColor.primaryColor,
                  maxLines: 1,
                  style: AppTextStyle.boldTextStyle.copyWith(
                    fontSize: 13.sp,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '제목을 입력하세요.',
                    hintStyle: AppTextStyle.hintStyle.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 0.5.h,
                  color: AppColor.hintColor,
                ),
                SizedBox(height: 5.h),
              ],
            ),
            Expanded(
              child: TextField(
                controller: questionTextController,
                cursorColor: AppColor.primaryColor,
                maxLines: null,
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '질문을 입력하세요.',
                  hintStyle: AppTextStyle.hintStyle.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
            if (pictures.value.isEmpty)
              Container()
            else
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150.h,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      picturesCurIndex.value = index + 1;
                    },
                  ),
                  items: pictures.value.map((i) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.file(
                              i,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 7.5.w,
                          left: 7.5.w,
                          child: Container(
                            width: 40.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.w,
                                color: AppColor.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                '${picturesCurIndex.value} / ${pictures.value.length}',
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  color: AppColor.primaryColor,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 7.5.w,
                          right: 7.5.w,
                          child: GestureDetector(
                            onTap: () {
                              pictures.value
                                  .removeAt(picturesCurIndex.value - 1);
                              // 다시 담아줘야 state 변경함.
                              pictures.value = [...pictures.value];
                              picturesCurIndex.value =
                                  picturesCurIndex.value - 1;
                            },
                            child: SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  AssetsConstants.clear,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 50.h,
        child: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await pickCamera();
                        if (image != null) {
                          pictures.value.add(image);
                          pictures.value = [...pictures.value];
                        }
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.camera,
                        width: 22.5.w,
                        height: 22.5.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: () async {
                        final images = await pickImages();
                        if (images.isNotEmpty) {
                          // 계속 추가
                          pictures.value = [...pictures.value, ...images];
                        }
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.picture,
                        width: 22.5.w,
                        height: 22.5.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    // point
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: () => showPrepareDialog(context),
                      child: SvgPicture.asset(
                        AssetsConstants.logo,
                        width: 20.w,
                        height: 20.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // page
                        ref.read(communityControllerProvider.notifier).editPage(
                              pictures.value,
                              page: page.pages!.seq as int,
                              theme: toSeq,
                              title: titleTextController.text,
                              content: questionTextController.text,
                              private: privateCheck.value ? "0" : "1",
                              context: context,
                              ref: ref,
                            );
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '보내기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              SvgPicture.asset(
                                AssetsConstants.share,
                                width: 15.w,
                                height: 15.w,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
