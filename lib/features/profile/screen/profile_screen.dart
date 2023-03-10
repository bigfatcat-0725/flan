import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/default/controller/default_controller.dart';
import 'package:flan/features/main/widget/main_card.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/features/profile/widget/profile_card_new.dart';
import 'package:flan/features/profile/widget/profile_card_reject.dart';
import 'package:flan/features/search/controller/search_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
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

    useEffect(() {
      if (context.mounted) {
        Future.microtask(() async {
          // 팔로우 여부
          isFollow.value =
              await ref.read(profileControllerProvider.notifier).isFollow(
                    my: userInfo!.userInfo!.seq as int,
                    other: feedSeq,
                  );
        });
      }
    });

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
                  SizedBox(height: 8.w),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.w,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2.5,
                          color: Color(0xffcccccc),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: data.myData!.photo != ''
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '${data.follower!.length}',
                                                style: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                'người đi theo',
                                                style: AppTextStyle
                                                    .defaultTextStyle
                                                    .copyWith(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${data.following!.length}',
                                                style: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                'Tiếp theo',
                                                style: AppTextStyle
                                                    .defaultTextStyle
                                                    .copyWith(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // 현재 myData 에 답변완료 수 이상으로 확실한 값 사용.
                                          Column(
                                            children: [
                                              Text(
                                                '${finList.length}',
                                                style: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                'hoàn thành',
                                                style: AppTextStyle
                                                    .defaultTextStyle
                                                    .copyWith(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                data.myData!.nickname.toString(),
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     showProfileMore(context,
                        //         myData: currentUser.value == true ? 1 : 0,
                        //         id: currentUser.value == true
                        //             ? 'flan.com/${userInfo.userInfo!.email!.split('@')[0]}'
                        //             : 'flan.com/${data.myData!.email!.split('@')[0]}');
                        //   },
                        //   child: Container(
                        //     color: Colors.transparent,
                        //     child: Icon(
                        //       Icons.more_horiz,
                        //       size: 20.w,
                        //       color: AppColor.primaryColor,
                        //     ),
                        //   ),
                        // ),

                        // 자신의 프로필이라면 비어있을 경우 나타내고, 아니라면 그대로
                        SizedBox(height: 2.5.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                (data.myData!.memo.toString() == '' ||
                                        data.myData!.memo.toString() == 'null')
                                    ? 'Viết một thông báo trạng thái!'
                                    : data.myData!.memo.toString(),
                                style: (data.myData!.memo.toString() == '' ||
                                        data.myData!.memo.toString() == 'null')
                                    ? AppTextStyle.hintStyle
                                    : AppTextStyle.defaultTextStyle,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
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
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            border: Border.all(
                                              width: 1.w,
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'khóa',
                                              style: AppTextStyle
                                                  .defaultTextStyle
                                                  .copyWith(
                                                fontSize: 11.sp,
                                                color: AppColor.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(profileControllerProvider
                                                  .notifier)
                                              .follow(
                                                from: userInfo.userInfo!.seq
                                                    as int,
                                                to: feedSeq,
                                              );

                                          isFollow.value = !isFollow.value;

                                          ref.invalidate(
                                              feedProivder(feedSeqLogic));
                                          print(feedSeqLogic);
                                        },
                                        child: Container(
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: isFollow.value
                                                ? Colors.white
                                                : AppColor.primaryColor,
                                            border: isFollow.value
                                                ? Border.all(
                                                    width: 1.w,
                                                    color:
                                                        AppColor.primaryColor,
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(
                                              isFollow.value
                                                  ? 'Tiếp theo'
                                                  : 'Theo',
                                              style: AppTextStyle
                                                  .defaultTextStyle
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
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Đặt một câu hỏi',
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.5,
                            color: Color(0xffcccccc),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 32.5.h,
                            child: TabBar(
                              controller: tabController,
                              labelStyle: AppTextStyle.boldTextStyle,
                              unselectedLabelStyle:
                                  AppTextStyle.defaultTextStyle,
                              unselectedLabelColor: AppColor.hintColor,
                              labelColor: AppColor.textColor,
                              indicatorColor: AppColor.primaryColor,
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Tab(
                                  text: 'Chờ đợi(${ingList.length})',
                                ),
                                Tab(
                                  text: 'hoàn thành(${finList.length})',
                                ),
                                Tab(
                                  text: 'từ chối(${canList.length})',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
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
                                ListView.separated(
                                  // physics: const ClampingScrollPhysics(),
                                  itemCount: finList.length,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: 0.8.w,
                                      color: const Color(0xffd9d9d9),
                                    );
                                  },
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
                  ),
                ],
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
