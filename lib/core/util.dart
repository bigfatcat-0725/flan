import 'dart:io';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: AppTextStyle.defaultTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      duration: const Duration(seconds: 1),
    ),
  );
}

void loginShowSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: AppTextStyle.defaultTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.textColor,
      duration: const Duration(seconds: 1),
    ),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  final ImagePicker picker = ImagePicker();
  final imageFiles = await picker.pickMultiImage();
  if (imageFiles.isNotEmpty) {
    for (final image in imageFiles) {
      images.add(File(image.path));
    }
  }
  print(images);
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
                '서비스 준비중입니다.',
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
                      '확인',
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
                      '확인',
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
                      '확인',
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
                style: AppTextStyle.boldTextStyle.copyWith(
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
                style: AppTextStyle.boldTextStyle.copyWith(
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

Future showMore(BuildContext context,
    {String type = 'default', int myData = 0, required Question data}) {
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
                                      '차단',
                                      style: AppTextStyle.defaultTextStyle
                                          .copyWith(
                                        color: AppColor.errorColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
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
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.w),
        );
      });
}

Future showProfileNewCardMore(BuildContext context) {
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
                          '차단',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColor.errorColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
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

Future showProfileMore(BuildContext context, {int myData = 1}) {
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
                                '차단',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  color: AppColor.errorColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
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
                        const ClipboardData(text: 'flan.com/hansol'),
                      );
                      showSnackBar(context, '클립보드에 복사되었습니다.');
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
                          '프로필 URL 복사',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
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
                          '이 프로필 공유하기',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
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
                          'QR 코드',
                          style: AppTextStyle.defaultTextStyle.copyWith(),
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
