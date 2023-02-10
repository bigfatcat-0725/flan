import 'package:flan/constants/ui_constants.dart';
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
    final bell0 = useState(false);
    final bell1 = useState(false);
    final bell2 = useState(false);
    final bell3 = useState(false);
    final bell4 = useState(false);
    final bell5 = useState(false);

    final bellBoolList = [bell0, bell1, bell2, bell3, bell4, bell5];
    final bellList = [
      '새 질문 알림',
      '답변 알림',
      '커뮤니티 댓글 알림',
      '커뮤니티 대댓글 알림',
      '팔로우 알림',
      '공지사항 알림'
    ];

    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '알림 설정'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        children: [
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
                            style: AppTextStyle.boldTextStyle.copyWith(),
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
