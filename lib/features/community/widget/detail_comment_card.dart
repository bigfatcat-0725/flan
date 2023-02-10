import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/assets_constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/core/util.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/app_color.dart';
import 'package:flan/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailCommentCard extends HookConsumerWidget {
  const DetailCommentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final img = useState(
        'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/linkagelab/20210521225127146gnfp.jpg');
    // 1 익명 0 실명
    // 익명이면 프로필 타고 들어갈 수도 없음.
    final userStatus = useState(1);
    final bottomNav = ref.watch(bottomNavProvier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // 그 사람의 프로필 탭으로 이동.
                    // 프로필 탭은 항상 유저의 seq 를 필요로 할 것.
                    ref.read(bottomNavProvier.notifier).onChange(3);
                    context.push('/');
                  },
                  child: Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: img.value == '' || userStatus.value == 1
                        ? SvgPicture.asset(
                            AssetsConstants.noImg,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: img.value,
                              placeholder: (context, text) {
                                return SvgPicture.asset(
                                  AssetsConstants.noImg,
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 익명이 아닐 경우 이동 가능.
                        if (userStatus.value != 1) {
                          ref.read(bottomNavProvier.notifier).onChange(3);
                          context.push('/');
                        }
                      },
                      child: Text(
                        userStatus.value == 1 ? '익명' : '한솔',
                        style: AppTextStyle.boldTextStyle,
                      ),
                    ),
                    Text(
                      '4시간 전',
                      style: AppTextStyle.hintStyle.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showMore(context, type: 'not default', data: Question());
              },
              child: Icon(
                Icons.more_horiz,
                size: 20.w,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 55.w),
          child: const Text('답변을 합니다.'),
        ),
      ],
    );
  }
}
