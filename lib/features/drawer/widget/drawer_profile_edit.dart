import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerProfileEdit extends HookConsumerWidget {
  // name or desc
  final String type;
  const DrawerProfileEdit({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    useEffect(() {
      if (type == 'name') {
        textController.text =
            (userInfo.userInfo!.nickname.toString() == 'null' ||
                    userInfo.userInfo!.nickname.toString() == '')
                ? ''
                : userInfo.userInfo!.nickname.toString();
      } else {
        textController.text = (userInfo.userInfo!.memo.toString() == 'null' ||
                userInfo.userInfo!.memo.toString() == '')
            ? ''
            : userInfo.userInfo!.memo.toString();
      }
    }, []);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar:
          UIConstants.qaAppBar(context, type == 'name' ? '사용자 이름' : '프로필 소개'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type == 'name' ? '사용자 이름' : '프로필 소개',
              style: AppTextStyle.greyStyle,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppColor.primaryColor,
                    style: AppTextStyle.defaultTextStyle,
                    maxLines: null,
                    maxLength: type == 'name' ? 15 : 150,
                    controller: textController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5.w, color: AppColor.hintColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.w, color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    textController.text = '';
                  },
                  child: Icon(
                    Icons.clear_rounded,
                    size: 20.w,
                    color: AppColor.greyColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.5.h),
            Text(
              '사용자 이름은 중복을 허용하지 않습니다.',
              style: AppTextStyle.hintStyle.copyWith(
                fontSize: 11.sp,
              ),
            ),
            SizedBox(height: 30.h),

            // 유효성 검사 해야함.
            GestureDetector(
              onTap: () {
                if (type == 'name') {
                  ref.read(drawerControllerProvider.notifier).changeName(
                        userModel: userInfo,
                        name: textController.text == 'null'
                            ? ''
                            : textController.text,
                        ref: ref,
                        context: context,
                      );
                } else {
                  ref.read(drawerControllerProvider.notifier).changeMemo(
                        userModel: userInfo,
                        memo: textController.text == 'null'
                            ? ''
                            : textController.text,
                        ref: ref,
                        context: context,
                      );
                }
              },
              child: Container(
                width: 1.sw,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    '변경',
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
    );
  }
}
