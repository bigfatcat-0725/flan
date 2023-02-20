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

class SettingFindPassword extends HookConsumerWidget {
  const SettingFindPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: UIConstants.qaAppBar(context, '비밀번호 변경'),
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
