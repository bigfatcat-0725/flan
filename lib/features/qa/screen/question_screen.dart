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
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionScreen extends HookConsumerWidget {
  final String type;
  final int toSeq;
  const QuestionScreen({
    Key? key,
    this.type = 'default',
    required this.toSeq,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privateCheck = useState(true);
    final pictures = useState(<File>[]);
    final picturesCurIndex = useState(1);
    final tagTextController = useTextEditingController();

    final titleTextController = useTextEditingController();
    final questionTextController = useTextEditingController();

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;

    // Theme
    final currentCategory = ref.watch(currentCategoryProvier);
    final cureentCategorySeq = ref.watch(currentCategorySeqProvier);

    final tagList = useState([]);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '질문하기'),
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
            if (type == 'community')
              Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              controller: tagTextController,
                              cursorColor: AppColor.primaryColor,
                              maxLines: 1,
                              style: AppTextStyle.defaultTextStyle.copyWith(
                                fontSize: 13.sp,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '#태그를 입력해주세요.',
                                hintStyle: AppTextStyle.hintStyle.copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            Container(
                              width: 1.sw,
                              height: 0.5.h,
                              color: AppColor.hintColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          tagList.value.add(tagTextController.text);
                          tagList.value = [...tagList.value];
                          print(tagList.value);
                          tagTextController.clear();
                        },
                        child: Container(
                          width: 100.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              '태그추가',
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
                  SizedBox(height: 5.h),
                  Wrap(
                    spacing: 2.5.w,
                    children: List.generate(
                      tagList.value.length,
                      (index) => Chip(
                        onDeleted: () {
                          tagList.value.removeAt(index);
                          tagList.value = [...tagList.value];
                        },
                        deleteIconColor: Colors.white,
                        label: Text(
                          tagList.value[index],
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: AppColor.primaryColor,
                        elevation: 0,
                        padding: const EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            if (type == 'community')
              Column(
                children: [
                  SizedBox(height: 20.h),
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
                          height: 150.h,
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
                              if (picturesCurIndex.value != 1) {
                                picturesCurIndex.value =
                                    picturesCurIndex.value - 1;
                              }
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
                          if (pictures.value.length < 3) {
                            pictures.value.add(image);
                          }
                          if (pictures.value.length > 3) {
                            pictures.value.add(image);
                            pictures.value = [...pictures.value.sublist(0, 3)];
                          }
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
                          if (pictures.value.length < 3) {
                            pictures.value = [...pictures.value, ...images];
                          }
                          if (pictures.value.length > 3) {
                            pictures.value = [...pictures.value.sublist(0, 3)];
                          }
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
                        // 질문 생성
                        if (type == 'community') {
                          ref
                              .read(communityControllerProvider.notifier)
                              .postPage(
                                pictures.value,
                                user: userInfo!.userInfo!.seq as int,
                                tag: tagList.value.join(','),
                                title: titleTextController.text,
                                content: questionTextController.text,
                                private: privateCheck.value ? "0" : "1",
                                context: context,
                                ref: ref,
                              );
                        } else {
                          ref
                              .read(profileControllerProvider.notifier)
                              .postQuestion(
                                pictures.value,
                                user: userInfo!.userInfo!.seq as int,
                                to: toSeq,
                                title: questionTextController.text,
                                private: privateCheck.value ? "0" : "1",
                                context: context,
                                ref: ref,
                              );
                        }
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
