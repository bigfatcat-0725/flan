import 'package:flan/constants/ui_constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingTheme extends HookConsumerWidget {
  const SettingTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = useState(AppColor.primaryColor);

    void changeColor(int color) async {
      await Hive.openBox('settingBox');
      final settingBox = Hive.box('settingBox');
      settingBox.put('color', color);
    }

    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '테마 설정'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180.h,
              color: color.value,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    changeColor(color.value.value);
                    showReboot(context);
                  },
                  child: Container(
                    width: 130.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1.w, color: Colors.white),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "테마색 변경",
                            style: AppTextStyle.boldTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.change_circle_outlined,
                            size: 20.w,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                margin: EdgeInsets.only(top: 10.h),
                width: 1.sw,
                child: BlockPicker(
                  pickerColor: color.value,
                  onColorChanged: (Color value) {
                    color.value = value;
                  },
                  itemBuilder: (color, check, fn) {
                    return GestureDetector(
                      onTap: fn,
                      child: Container(
                        margin: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                        child: check
                            ? Center(
                                child: Icon(
                                  Icons.check_rounded,
                                  size: 25.w,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
