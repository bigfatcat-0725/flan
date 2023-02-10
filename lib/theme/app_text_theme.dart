import 'package:flan/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static final theme = ThemeData(
    primaryColor: AppColor.primaryColor,
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.defaultTextStyle,
    ),
  );
}

class AppTextStyle {
  static final TextStyle defaultTextStyle = TextStyle(
    fontFamily: 'SCDream',
    fontWeight: FontWeight.w300,
    color: AppColor.textColor,
    fontSize: 12.sp,
    height: 1.5,
  );
  static final TextStyle boldTextStyle = TextStyle(
    fontFamily: 'SCDream',
    fontWeight: FontWeight.w400,
    color: AppColor.textColor,
    fontSize: 12.sp,
    height: 1.5,
  );
  static final TextStyle hintStyle = TextStyle(
    fontFamily: 'SCDream',
    fontWeight: FontWeight.w200,
    color: AppColor.hintColor,
    fontSize: 12.sp,
    height: 1.5,
  );
  static final TextStyle greyStyle = TextStyle(
    fontFamily: 'SCDream',
    fontWeight: FontWeight.w300,
    color: AppColor.greyColor,
    fontSize: 12.sp,
    height: 1.5,
  );
}
