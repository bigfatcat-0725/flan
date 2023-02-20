import 'dart:async';
import 'dart:io';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart'
    as BookmarkPageModel;
import 'package:flan/models/bookmark/bookmark_question_model.dart';
import 'package:flan/models/comment/comment_model.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/home_feed/home_feed_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// context 침범 조심.
// void showSnackBar(BuildContext context, String content) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         content,
//         style: AppTextStyle.defaultTextStyle.copyWith(
//           color: Colors.white,
//         ),
//       ),
//       backgroundColor: AppColor.primaryColor,
//       duration: const Duration(seconds: 1),
//     ),
//   );
// }

// void loginShowSnackBar(BuildContext context, String content) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         content,
//         style: AppTextStyle.defaultTextStyle.copyWith(
//           color: Colors.white,
//         ),
//       ),
//       backgroundColor: AppColor.textColor,
//       duration: const Duration(seconds: 1),
//     ),
//   );
// }

Future<List<File>> pickImages() async {
  List<File> images = [];
  final ImagePicker picker = ImagePicker();
  final imageFiles = await picker.pickMultiImage();
  if (imageFiles.isNotEmpty) {
    for (final image in imageFiles) {
      images.add(File(image.path));
    }
  }

  return images;
}

Future<File?> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final imageFile = await picker.pickImage(source: ImageSource.gallery);
  if (imageFile != null) {
    return File(imageFile.path);
  }
  return null;
}

Future<File?> pickCamera() async {
  final ImagePicker picker = ImagePicker();
  final imageFile = await picker.pickImage(source: ImageSource.camera);
  if (imageFile != null) {
    return File(imageFile.path);
  }
  return null;
}

Future showPrepareDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        content: SizedBox(
          width: 290.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Dịch vụ đang được chuẩn bị.',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Được rồi',
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      );
    },
  );
}

Future showDefaultDialog(context, text) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        content: SizedBox(
          width: 290.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Được rồi',
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      );
    },
  );
}

Future showReboot(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        content: SizedBox(
          width: 290.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '이 설정은 앱을 재시작한 후 적용됩니다.',
                style: AppTextStyle.boldTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 100.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      'Được rồi',
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      );
    },
  );
}

Future showPageDelete(
  context, {
  required WidgetRef ref,
  required int pageSeq,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        content: SizedBox(
          width: 290.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '삭제하시겠습니까?',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1.w,
                            color: AppColor.primaryColor,
                          )),
                      child: Center(
                        child: Text(
                          '취소',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      ref.read(communityControllerProvider.notifier).deletePage(
                            pageSeq: pageSeq,
                            ref: ref,
                            context: context,
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
                        child: Text(
                          '삭제',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      );
    },
  );
}

Future showDelete(
  context, {
  required WidgetRef ref,
  required int userSeq,
  required int questionSeq,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        content: SizedBox(
          width: 290.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '삭제하시겠습니까?',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1.w,
                            color: AppColor.primaryColor,
                          )),
                      child: Center(
                        child: Text(
                          '취소',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(profileControllerProvider.notifier)
                          .deleteQuestion(
                            questionSeq: questionSeq,
                            ref: ref,
                            userSeq: userSeq,
                          );
                      context.pop();
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
                          '삭제',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      );
    },
  );
}

Future bookmakrPageMore(
  BuildContext context, {
  int myData = 0,
  required BookmarkPageModel.BookmarkPageModel page,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);
                            report(
                              context,
                              type: 'p',
                              user: userInfo!.userInfo!.seq as int,
                              seq: page.pages!.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final current =
                                ref.watch(currentCategorySeqProvier);
                            context.pop();
                            context.push(
                              '/bookmark_community_page_edit',
                              extra: {
                                'page': page,
                                'toSeq': current,
                              },
                            );
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                            ref
                                .read(communityControllerProvider.notifier)
                                .deletePage(
                                  pageSeq: page.pages!.seq as int,
                                  ref: ref,
                                  context: context,
                                );
                            final userInfo = ref.watch(userInfoProvier);
                            ref.invalidate(bookmarkPageProivder(
                                userInfo!.userInfo!.seq as int));
                            context.pop();
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future drawerPageMore(
  BuildContext context, {
  int myData = 0,
  required Pages page,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);
                            report(
                              context,
                              type: 'p',
                              user: userInfo!.userInfo!.seq as int,
                              seq: page.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final current =
                                ref.watch(currentCategorySeqProvier);
                            context.pop();
                            context.push(
                              '/drawer_page_edit',
                              extra: {
                                'page': page,
                                'toSeq': current,
                              },
                            );
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                            ref
                                .read(communityControllerProvider.notifier)
                                .deletePage(
                                  pageSeq: page.seq as int,
                                  ref: ref,
                                  context: context,
                                );
                            context.pop();
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future pageMore(
  BuildContext context, {
  int myData = 0,
  required PageModel page,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);
                            report(
                              context,
                              type: 'p',
                              user: userInfo!.userInfo!.seq as int,
                              seq: page.pages!.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final current =
                                ref.watch(currentCategorySeqProvier);
                            context.pop();
                            context.push(
                              '/community_page_edit',
                              extra: {
                                'page': page,
                                'toSeq': current,
                              },
                            );
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                            ref
                                .read(communityControllerProvider.notifier)
                                .deletePage(
                                  pageSeq: page.pages!.seq as int,
                                  ref: ref,
                                  context: context,
                                );
                            context.pop();
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '게시물 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

const reportText = [
  '만남 / 전화/ 구인 / 타 SNS로 유도',
  '괴롭힘 또는 온라인 왕따',
  ' 자살 또는 자해 언급',
  '음란 및 청소년에게 부적절한 내용',
  '홍보, 상업적 광고 및 게시물 도배',
  '폭력 및 범죄 활동 유도'
];

Future report(
  BuildContext context, {
  required String type,
  required int user,
  required int seq,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var a in reportText)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        ref.read(defaultControllerProvider.notifier).report(
                              type: type,
                              user: user,
                              seq: seq,
                              report: a.toString(),
                            );
                        if (context.mounted) {
                          context.pop();
                        }
                      },
                      child: Container(
                        width: 1.sw,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            a.toString(),
                            style: AppTextStyle.defaultTextStyle.copyWith(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showMore(
  BuildContext context, {
  String type = 'default',
  int myData = 0,
  required Question data,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (type != 'default')
                    Column(
                      children: [
                        if (myData == 0)
                          Column(
                            children: [
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     width: 1.sw,
                              //     height: 40.h,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5),
                              //       color: Colors.white,
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         '차단',
                              //         style: AppTextStyle.defaultTextStyle
                              //             .copyWith(
                              //           color: AppColor.errorColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 5.h),
                              GestureDetector(
                                onTap: () {
                                  final userInfo = ref.watch(userInfoProvier);
                                  context.pop();
                                  report(
                                    context,
                                    type: type,
                                    seq: data.questions!.answer![0].answers!.seq
                                        as int,
                                    user: userInfo!.userInfo!.seq as int,
                                    ref: ref,
                                  );
                                },
                                child: Container(
                                  width: 1.sw,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '신고',
                                      style: AppTextStyle.defaultTextStyle
                                          .copyWith(
                                        color: AppColor.errorColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                            ],
                          ),
                      ],
                    ),
                  GestureDetector(
                    onTap: () {
                      context.push('/ask',
                          extra: {'question': data, 'type': 'edit'});
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '답변 수정하기',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      // 답변 삭제
                      ref.read(profileControllerProvider.notifier).deleteAnswer(
                            seq: data.questions!.answer![0].answers!.seq as int,
                            mySeq: data.users!.seq as int,
                            ref: ref,
                            context: context,
                          );
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '답변 삭제하기',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showMoreBookmark(
  BuildContext context, {
  String type = 'default',
  int myData = 0,
  required BookmarkQuestionModel data,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (type != 'default')
                    Column(
                      children: [
                        if (myData == 0)
                          Column(
                            children: [
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     width: 1.sw,
                              //     height: 40.h,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5),
                              //       color: Colors.white,
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         '차단',
                              //         style: AppTextStyle.defaultTextStyle
                              //             .copyWith(
                              //           color: AppColor.errorColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 5.h),
                              GestureDetector(
                                onTap: () {
                                  final userInfo = ref.watch(userInfoProvier);
                                  report(
                                    context,
                                    type: 'q',
                                    user: userInfo!.userInfo!.seq as int,
                                    seq: data.questions!.answer![0].answers!.seq
                                        as int,
                                    ref: ref,
                                  );
                                  if (context.mounted) {
                                    context.pop();
                                  }
                                },
                                child: Container(
                                  width: 1.sw,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '신고',
                                      style: AppTextStyle.defaultTextStyle
                                          .copyWith(
                                        color: AppColor.errorColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                            ],
                          ),
                      ],
                    ),
                  GestureDetector(
                    onTap: () {
                      context.push('/ask_bookmark',
                          extra: {'question': data, 'type': 'edit'});
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '답변 수정하기',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      // 답변 삭제
                      ref.read(profileControllerProvider.notifier).deleteAnswer(
                            seq: data.questions!.answer![0].answers!.seq as int,
                            mySeq: data.users!.seq as int,
                            ref: ref,
                            context: context,
                          );
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '답변 삭제하기',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showMoreHomeCard(
  BuildContext context, {
  String type = 'default',
  int myData = 0,
  required HomeFeedModel data,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (type != 'default')
                    Column(
                      children: [
                        if (myData == 0)
                          Column(
                            children: [
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Container(
                              //     width: 1.sw,
                              //     height: 40.h,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5),
                              //       color: Colors.white,
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         '차단',
                              //         style: AppTextStyle.defaultTextStyle
                              //             .copyWith(
                              //           color: AppColor.errorColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 5.h),
                              GestureDetector(
                                onTap: () {
                                  final userInfo = ref.watch(userInfoProvier);
                                  report(
                                    context,
                                    type: 'a',
                                    user: userInfo!.userInfo!.seq as int,
                                    seq: data.questions!.answer![0].answers!.seq
                                        as int,
                                    ref: ref,
                                  );
                                  if (context.mounted) {
                                    context.pop();
                                  }
                                },
                                child: Container(
                                  width: 1.sw,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '신고',
                                      style: AppTextStyle.defaultTextStyle
                                          .copyWith(
                                        color: AppColor.errorColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                            ],
                          ),
                      ],
                    ),
                  if (myData == 1)
                    GestureDetector(
                      onTap: () {
                        context.push('/ask_home',
                            extra: {'question': data, 'type': 'edit'});
                      },
                      child: Container(
                        width: 1.sw,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            '답변 수정하기',
                            style: AppTextStyle.defaultTextStyle.copyWith(),
                          ),
                        ),
                      ),
                    ),
                  if (myData == 1) SizedBox(height: 5.h),
                  if (myData == 1)
                    GestureDetector(
                      onTap: () {
                        // 답변 삭제
                        ref
                            .read(profileControllerProvider.notifier)
                            .deleteAnswer(
                              seq: data.questions!.answer![0].answers!.seq
                                  as int,
                              mySeq: data.users!.seq as int,
                              ref: ref,
                              context: context,
                            );
                      },
                      child: Container(
                        width: 1.sw,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            '답변 삭제하기',
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              color: AppColor.errorColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future commentMore(
  BuildContext context, {
  int myData = 0,
  required PageModel page,
  required CommentModel comment,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);
                            report(
                              context,
                              type: 'c',
                              user: userInfo!.userInfo!.seq as int,
                              seq: comment.comment!.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                            context.push('/community_edit',
                                extra: {'page': page, 'comment': comment});
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                            ref
                                .read(communityControllerProvider.notifier)
                                .deleteComment(
                                  seq: comment.comment!.seq as int,
                                  page: page,
                                  ref: ref,
                                  context: context,
                                );
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future commentDrawer(
  BuildContext context, {
  int myData = 0,
  required Pages page,
  required CommentModel comment,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);
                            report(
                              context,
                              type: 'c',
                              user: userInfo!.userInfo!.seq as int,
                              seq: comment.comment!.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                            context.push('/drawer_community_edit',
                                extra: {'page': page, 'comment': comment});
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                            ref
                                .read(communityControllerProvider.notifier)
                                .deleteCommentDrawer(
                                  seq: comment.comment!.seq as int,
                                  page: page,
                                  ref: ref,
                                  context: context,
                                );
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future commentMoreBookmark(
  BuildContext context, {
  int myData = 0,
  required BookmarkPageModel.BookmarkPageModel page,
  required CommentModel comment,
  required WidgetRef ref,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  if (myData == 0)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            final userInfo = ref.watch(userInfoProvier);

                            report(
                              context,
                              type: 'c',
                              user: userInfo!.userInfo!.seq as int,
                              seq: comment.comment!.seq as int,
                              ref: ref,
                            );
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  if (myData == 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                            context.push('/bookmark_community_edit',
                                extra: {'page': page, 'comment': comment});
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 수정하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {
                            // 답변 삭제
                          },
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '답변 삭제하기',
                                style: AppTextStyle.defaultTextStyle.copyWith(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showProfileNewCardMore(
  BuildContext context, {
  required WidgetRef ref,
  required int qSeq,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  // 차단, 신고는 본인의 경우 나타나지 않는다.
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 1.sw,
                  //     height: 40.h,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: Colors.white,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         '차단',
                  //         style: AppTextStyle.defaultTextStyle.copyWith(
                  //           color: AppColor.errorColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      final userInfo = ref.watch(userInfoProvier);
                      report(
                        context,
                        type: 'q',
                        user: userInfo!.userInfo!.seq as int,
                        seq: qSeq,
                        ref: ref,
                      );
                      if (context.mounted) {
                        context.pop();
                      }
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '신고',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showProfileMore(BuildContext context,
    {int myData = 1, required String id}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  // 차단, 신고는 본인의 경우 나타나지 않는다.
                  if (myData != 1)
                    Column(
                      children: [
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     width: 1.sw,
                        //     height: 40.h,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.white,
                        //     ),
                        //     child: Center(
                        //       child: Text(
                        //         '차단',
                        //         style: AppTextStyle.defaultTextStyle.copyWith(
                        //           color: AppColor.errorColor,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 1.sw,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '신고',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),

                  GestureDetector(
                    onTap: () {
                      // 클립보드 복사
                      Clipboard.setData(
                        ClipboardData(text: id),
                      );
                      showDefaultDialog(context, '클립보드에 복사되었습니다.');
                    },
                    child: Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '프로필 주소 복사',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 5.h),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 1.sw,
                  //     height: 40.h,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: Colors.white,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         '이 프로필 공유하기',
                  //         style: AppTextStyle.defaultTextStyle.copyWith(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 5.h),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 1.sw,
                  //     height: 40.h,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: Colors.white,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'QR 코드',
                  //         style: AppTextStyle.defaultTextStyle.copyWith(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}
