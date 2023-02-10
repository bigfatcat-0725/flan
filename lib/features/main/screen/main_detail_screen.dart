import 'package:flan/constants/constants.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainDetailScreen extends HookConsumerWidget {
  final Question data;
  const MainDetailScreen({
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
          MainCard(
            type: 'detail',
            data: data,
          ),
        ],
      ),
    );
  }
}
