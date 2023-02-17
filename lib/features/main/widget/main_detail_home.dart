import 'package:flan/constants/constants.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/features/main/widget/main_card_home.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/home_feed/home_feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainDetailHome extends HookConsumerWidget {
  final HomeFeedModel data;
  const MainDetailHome({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '상세보기'),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          HomeFeedCard(
            type: 'detail',
            data: data,
          ),
        ],
      ),
    );
  }
}
