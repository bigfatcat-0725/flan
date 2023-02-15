import 'package:flan/constants/constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerCommunityCard extends HookConsumerWidget {
  final Pages item;
  const DrawerCommunityCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final saveStatus = useState(false);
    final isLike = useState(false);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!;
    // 좋아요 && 북마크 확인

    useEffect(() {
      if (isMounted()) {
        Future.microtask(() async {
          final status =
              await ref.read(communityControllerProvider.notifier).isLikePage(
                    userSeq: userInfo.userInfo!.seq as int,
                    pageSeq: item.seq as int,
                  );
          final bookmarkStatus = await ref
              .read(bookmarkControllerProvider.notifier)
              .isBookmarkPage(
                userSeq: userInfo.userInfo!.seq as int,
                seq: item.seq as int,
              );

          if (isLike.hasListeners && status == 1) {
            isLike.value = true;
          } else {
            isLike.value = false;
          }
          if (saveStatus.hasListeners && bookmarkStatus == 1) {
            saveStatus.value = true;
          } else {
            saveStatus.value = false;
          }
        });
      }
      return null;
    }, [item]);
    // 위 item 을 인식하게 함으로써 완성.

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.push('/community_detail', extra: {
              'page': item,
            });
          },
          child: Container(
            color: AppColor.scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title.toString(),
                            style: AppTextStyle.boldTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            size: 20.w,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              item.content.toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: 1.sw,
                  height: 30.h,
                  color: const Color(0xffefefef),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final res = await ref
                                .read(communityControllerProvider.notifier)
                                .likePage(
                                  ref: ref,
                                  pageSeq: item.seq as int,
                                  userSeq: userInfo.userInfo!.seq as int,
                                );
                            if (res) {
                              isLike.value = !isLike.value;
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 30.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  isLike.value
                                      ? AssetsConstants.heartActive
                                      : AssetsConstants.heart,
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  color: isLike.value
                                      ? AppColor.primaryColor
                                      : AppColor.greyColor,
                                ),
                                SizedBox(width: 7.5.w),
                                Text(
                                  item.likes.toString(),
                                  style: AppTextStyle.greyStyle.copyWith(
                                    fontSize: 11.sp,
                                    color: isLike.value
                                        ? AppColor.primaryColor
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.push('/community_detail', extra: {
                              'page': item,
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 30.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetsConstants.comment,
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  color: AppColor.greyColor.withOpacity(0.6),
                                ),
                                SizedBox(width: 7.5.w),
                                Text(
                                  item.commentCnt.toString(),
                                  style: AppTextStyle.greyStyle.copyWith(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final res = await ref
                                .read(profileControllerProvider.notifier)
                                .pageBookmarking(
                                  page: item.seq as int,
                                  user: userInfo.userInfo!.seq as int,
                                  ref: ref,
                                );
                            if (res) {
                              saveStatus.value = !saveStatus.value;
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 30.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  saveStatus.value
                                      ? AssetsConstants.saveActive
                                      : AssetsConstants.save,
                                  width: 12.5.w,
                                  height: 12.5.w,
                                  color: saveStatus.value
                                      ? AppColor.primaryColor
                                      : AppColor.greyColor,
                                ),
                                SizedBox(width: 7.5.w),
                                Text(
                                  '저장',
                                  style: AppTextStyle.greyStyle.copyWith(
                                    fontSize: 11.sp,
                                    color: saveStatus.value
                                        ? AppColor.primaryColor
                                        : null,
                                  ),
                                ),
                              ],
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
        ),
      ],
    );
  }
}
