import 'package:flan/core/providers.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/widget/community_card.dart';
import 'package:flan/features/main/controller/main_controller.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/features/main/widget/main_card_home.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final currentTap = ref.watch(bottomNavProvier);
    final userInfo = ref.watch(userInfoProvier);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: ref.watch(homeFeedProvider(userInfo!.userInfo!.seq as int)).when(
            data: (data) {
              return Container(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return HomeFeedCard(data: data[index]);
                        },
                        itemCount: data.length,
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
    );
  }
}
