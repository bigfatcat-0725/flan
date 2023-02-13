import 'package:flan/constants/ui_constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingLanguage extends HookConsumerWidget {
  const SettingLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageList = ['영어', '베트남어', '한국어'];
    final currentLang = useState('한국어');

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '설정'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    currentLang.value = languageList[index];
                    showReboot(context);
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            languageList[index],
                            style: AppTextStyle.defaultTextStyle,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        if (languageList[index] == currentLang.value)
                          Icon(
                            Icons.check_rounded,
                            size: 15.w,
                            color: AppColor.primaryColor,
                          ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: languageList.length,
            ),
          ),
        ],
      ),
    );
  }
}
