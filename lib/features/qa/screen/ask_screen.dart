import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AskScreen extends HookConsumerWidget {
  final Question question;
  final String type;
  const AskScreen({
    Key? key,
    required this.type,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictures = useState(<File>[]);
    final picturesCurIndex = useState(1);
    final askTextController = useTextEditingController();
    final askNode = useFocusNode();

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;
    final profileImg = userInfo!.userInfo!.photo;

    // data 정리
    final String private = question.questions!.private as String;
    final String questionName = question.users!.nickname as String;
    final String questionContent = question.questions!.question as String;
    final String ago = question.questions!.remaining as String;

    useEffect(() {
      // 수정하기 텍스트 설정
      if (type == 'edit') {
        final String answerContent =
            question.questions!.answer![0].answers!.reply.toString();
        askTextController.text = answerContent;
        askNode.requestFocus();
      }
      return null;
    });

    // 게시물 이미지
    final List<String> contentImg =
        question.questions!.photo.toString().split(',');

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, type == 'edit' ? '답변수정' : '답변하기'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 17.5.w,
                            height: 17.5.w,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                'Q',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            private == "1" ? questionName : '익명',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 11.sp,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            ago,
                            style: AppTextStyle.hintStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        questionContent,
                        style: AppTextStyle.boldTextStyle.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: (profileImg != '')
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: 'http://topping.io:8855$profileImg',
                              placeholder: (context, text) {
                                return SvgPicture.asset(
                                  AssetsConstants.noImg,
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          )
                        : SvgPicture.asset(
                            AssetsConstants.noImg,
                          ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: askTextController,
                            focusNode: askNode,
                            cursorColor: AppColor.primaryColor,
                            maxLines: null,
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '답변을 입력하세요.',
                              hintStyle: AppTextStyle.hintStyle.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (pictures.value.isEmpty)
              Container()
            else
              CarouselSlider(
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
                        child: Image.file(
                          i,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Positioned(
                      //   top: 7.5.w,
                      //   left: 7.5.w,
                      //   child: Container(
                      //     width: 40.w,
                      //     height: 20.h,
                      //     decoration: BoxDecoration(
                      //       border: Border.all(
                      //         width: 1.w,
                      //         color: AppColor.primaryColor,
                      //       ),
                      //       borderRadius: BorderRadius.circular(100),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         '${picturesCurIndex.value} / ${pictures.value.length}',
                      //         style: AppTextStyle.boldTextStyle.copyWith(
                      //           color: AppColor.primaryColor,
                      //           fontSize: 10.sp,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 7.5.w,
                      //   right: 7.5.w,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       pictures.value.removeAt(picturesCurIndex.value - 1);
                      //       // 다시 담아줘야 state 변경함.
                      //       pictures.value = [...pictures.value];
                      //       if (picturesCurIndex.value != 0) {
                      //         picturesCurIndex.value =
                      //             picturesCurIndex.value - 1;
                      //       }
                      //     },
                      //     child: SizedBox(
                      //       width: 20.w,
                      //       height: 20.w,
                      //       child: FittedBox(
                      //         child: SvgPicture.asset(
                      //           AssetsConstants.clear,
                      //           color: AppColor.primaryColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                }).toList(),
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
                        // 답변 생성
                        if (type == 'edit') {
                          ref
                              .read(profileControllerProvider.notifier)
                              .editAnswer(
                                user: userInfo.userInfo!.seq as int,
                                answerSeq: question
                                    .questions!.answer![0].answers!.seq as int,
                                reply: askTextController.text,
                                context: context,
                                ref: ref,
                              );
                        } else {
                          ref
                              .read(profileControllerProvider.notifier)
                              .postAnswer(
                                pictures.value,
                                user: userInfo.userInfo!.seq as int,
                                questionSeq: question.questions!.seq as int,
                                title: askTextController.text,
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
