import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecommendCard extends HookConsumerWidget {
  final UserInfo userInfo;
  const RecommendCard({
    required this.userInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollow = useState(false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (userInfo.photo == '' || userInfo.photo == null)
                  ? GestureDetector(
                      onTap: () {
                        // 유저 seq 가져와서 프로필(피드)로 이동.
                        // 이 유저인포는 본인 데이터가 아님.
                        ref
                            .read(feedSeqProvider.notifier)
                            .onChange(userInfo.seq as int);
                        ref.read(bottomNavProvier.notifier).onChange(3);
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.noImg,
                        width: 45.w,
                        height: 45.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        // 유저 seq 가져와서 프로필(피드)로 이동.
                        ref
                            .read(feedSeqProvider.notifier)
                            .onChange(userInfo.seq as int);
                        ref.read(bottomNavProvier.notifier).onChange(3);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: 'http://topping.io:8855${userInfo.photo}',
                          placeholder: (context, text) {
                            return SvgPicture.asset(
                              AssetsConstants.noImg,
                            );
                          },
                          width: 45.w,
                          height: 45.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInfo.nickname.toString(),
                    style: AppTextStyle.boldTextStyle.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  // SizedBox(height: 5.h),
                  // Text(
                  //   '답변율 95%',
                  //   style: AppTextStyle.hintStyle.copyWith(
                  //     fontSize: 11.sp,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              isFollow.value = !isFollow.value;
            },
            child: Container(
              width: 80.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isFollow.value ? Colors.white : AppColor.primaryColor,
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
                  style: AppTextStyle.defaultTextStyle.copyWith(
                    fontSize: 11.sp,
                    color:
                        isFollow.value ? AppColor.primaryColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
