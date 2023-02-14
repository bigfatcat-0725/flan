import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/features/profile/widget/profile_card_new.dart';
import 'package:flan/features/profile/widget/profile_card_reject.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollow = useState(true);
    final tabController = useTabController(initialLength: 3);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;

    // 내 피드인지
    final currentUser = useState(true);

    // 피드 Seq 관리
    final feedSeq = ref.watch(feedSeqProvider);

    final feedSeqLogic =
        feedSeq == 0 ? userInfo!.userInfo!.seq as int : feedSeq;

    final feedVisible = useState(true);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: ref.watch(feedProivder(feedSeqLogic)).when(
            data: (data) {
              if (data.myData!.seq == userInfo!.userInfo!.seq) {
                currentUser.value = true;
              } else {
                // 타인 피드
                currentUser.value = false;
              }

              final List<Question> ingList = data.ingQuestion!;
              final List<Question> finList = data.finQuestion!;
              final List<Question> canList = data.canQuestion!;

              return Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Container(
                              width: 75.w,
                              height: 75.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: data.myData!.photo != ''
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'http://topping.io:8855${data.myData!.photo}',
                                        placeholder: (context, text) {
                                          return SvgPicture.asset(
                                            AssetsConstants.noImg,
                                          );
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      AssetsConstants.noImg,
                                    ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data.myData!.nickname.toString(),
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '팔로워 ${data.myData!.followCnt}  |  ',
                                        style:
                                            AppTextStyle.boldTextStyle.copyWith(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      Text(
                                        '팔로잉 ${data.myData!.followingCnt}  |  ',
                                        style:
                                            AppTextStyle.boldTextStyle.copyWith(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      // 현재 myData 에 답변완료 수 이상으로 확실한 값 사용.
                                      Text(
                                        '답변완료 ${finList.length}',
                                        style:
                                            AppTextStyle.boldTextStyle.copyWith(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  // 자신의 프로필이라면 비어있을 경우 나타내고, 아니라면 그대로
                                  Text(
                                    (data.myData!.memo.toString() == '' ||
                                            data.myData!.memo.toString() ==
                                                'null')
                                        ? '상태메세지를 작성해보세요!'
                                        : data.myData!.memo.toString(),
                                    style:
                                        (data.myData!.memo.toString() == '' ||
                                                data.myData!.memo.toString() ==
                                                    'null')
                                            ? AppTextStyle.hintStyle
                                            : AppTextStyle.defaultTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            // 다른 사람의 프로필이라면 팔로우 표시
                            // 자기 자신이라면 보관함 표시
                            Expanded(
                              child: currentUser.value
                                  ? GestureDetector(
                                      onTap: () {
                                        context.go('/bookmark');
                                      },
                                      child: Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.white,
                                          border: Border.all(
                                            width: 1.w,
                                            color: AppColor.primaryColor,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '보관함',
                                            style: AppTextStyle.defaultTextStyle
                                                .copyWith(
                                              fontSize: 11.sp,
                                              color: isFollow.value
                                                  ? AppColor.primaryColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        isFollow.value = !isFollow.value;
                                      },
                                      child: Container(
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: isFollow.value
                                              ? Colors.white
                                              : AppColor.primaryColor,
                                          border: isFollow.value
                                              ? Border.all(
                                                  width: 1.w,
                                                  color: AppColor.primaryColor,
                                                )
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            isFollow.value ? '팔로잉' : '팔로우',
                                            style: AppTextStyle.defaultTextStyle
                                                .copyWith(
                                              fontSize: 11.sp,
                                              color: isFollow.value
                                                  ? AppColor.primaryColor
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.push('/question', extra: {
                                    'type': '',
                                    'toSeq': data.myData!.seq,
                                  });
                                },
                                child: Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '질문하기',
                                      style: AppTextStyle.defaultTextStyle
                                          .copyWith(
                                        fontSize: 11.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          labelStyle: AppTextStyle.boldTextStyle,
                          unselectedLabelColor: AppColor.hintColor,
                          labelColor: AppColor.textColor,
                          indicatorColor: AppColor.primaryColor,
                          tabs: [
                            Tab(
                              text: '미답변 (${ingList.length})',
                            ),
                            Tab(
                              text: '답변완료 (${finList.length})',
                            ),
                            Tab(
                              text: '거절 (${canList.length})',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                itemCount: ingList.length,
                                itemBuilder: (context, index) {
                                  final ingData = ingList[index];

                                  return ProfileCardNew(
                                    data: ingData,
                                    isMyData: currentUser.value ? 1 : 0,
                                  );
                                },
                              ),
                              ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                itemCount: finList.length,
                                itemBuilder: (context, index) {
                                  final finData = finList[index];
                                  return MainCard(
                                    data: finData,
                                  );
                                },
                              ),
                              ListView.builder(
                                // physics: const ClampingScrollPhysics(),
                                itemCount: canList.length,
                                itemBuilder: (context, index) {
                                  final canData = canList[index];
                                  return ProfileCardReject(
                                    data: canData,
                                    isMyData: currentUser.value ? 1 : 0,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            ),
          ),
    );
  }
}
