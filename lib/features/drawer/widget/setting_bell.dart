import 'package:flan/constants/ui_constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingBell extends HookConsumerWidget {
  const SettingBell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newN = useState(false);
    final newQ = useState(false);
    final newA = useState(false);
    final newC = useState(false);
    final bellBoolList = [newN, newQ, newA, newC];
    final bellList = [
      '공지사항 알림',
      '질문 알림',
      '답변 알림',
      '댓글 알림',
    ];
    final userInfo = ref.watch(userInfoProvier);

    useEffect(() {
      if (context.mounted) {}
      return null;
    });

    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '알림 설정'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    bellBoolList[index].value = !bellBoolList[index].value;
                  },
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            bellList[index],
                            style: AppTextStyle.defaultTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        CupertinoSwitch(
                          value: bellBoolList[index].value,
                          onChanged: (value) {
                            bellBoolList[index].value =
                                !bellBoolList[index].value;
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: bellList.length,
            ),
          ),
        ],
      ),
    );
  }
}
