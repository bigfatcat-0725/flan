import 'package:flan/constants/constants.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/bookmark/bookmark_page_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkCommunityCard extends HookConsumerWidget {
  final BookmarkPageModel item;
  const BookmarkCommunityCard({
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
                    pageSeq: item.pages!.seq as int,
                  );
          final bookmarkStatus = await ref
              .read(bookmarkControllerProvider.notifier)
              .isBookmarkPage(
                userSeq: userInfo.userInfo!.seq as int,
                seq: item.pages!.seq as int,
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

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push('/bookmark_community_detail', extra: {
                'page': item,
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsConstants.community,
                                  width: 17.5.w,
                                  height: 17.5.w,
                                  color: AppColor.primaryColor,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  item.pages?.private == 1
                                      ? item.users!.nickname.toString()
                                      : '익명',
                                  style: AppTextStyle.defaultTextStyle.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  item.pages!.remaining.toString(),
                                  style: AppTextStyle.hintStyle.copyWith(
                                    fontSize: 10.5.sp,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                final myData =
                                    userInfo.userInfo!.seq == item.users!.seq
                                        ? 1
                                        : 0;

                                bookmakrPageMore(
                                  context,
                                  myData: myData,
                                  page: item,
                                  ref: ref,
                                );
                              },
                              child: Icon(
                                Icons.more_horiz,
                                size: 20.w,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          item.pages!.title.toString(),
                          style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.pages!.content.toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final res = await ref
                                        .read(communityControllerProvider
                                            .notifier)
                                        .likePage(
                                          ref: ref,
                                          pageSeq: item.pages!.seq as int,
                                          userSeq:
                                              userInfo.userInfo!.seq as int,
                                        );
                                    if (res) {
                                      isLike.value = !isLike.value;
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    isLike.value
                                        ? AssetsConstants.heartActive
                                        : AssetsConstants.heart,
                                    width: 14.w,
                                    height: 14.w,
                                    color: isLike.value
                                        ? AppColor.primaryColor
                                        : AppColor.greyColor,
                                  ),
                                ),
                                SizedBox(width: 7.5.w),
                                Text(
                                  item.pages!.likes.toString(),
                                  style: AppTextStyle.greyStyle.copyWith(
                                    fontSize: 11.sp,
                                    color: isLike.value
                                        ? AppColor.primaryColor
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 15.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetsConstants.comment,
                                  width: 14.w,
                                  height: 14.w,
                                  color: AppColor.greyColor.withOpacity(0.6),
                                ),
                                SizedBox(width: 7.5.w),
                                Text(
                                  item.pages!.commentCnt.toString(),
                                  style: AppTextStyle.greyStyle.copyWith(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final res = await ref
                                    .read(profileControllerProvider.notifier)
                                    .pageBookmarking(
                                      page: item.pages!.seq as int,
                                      user: userInfo.userInfo!.seq as int,
                                      ref: ref,
                                    );
                                if (res) {
                                  saveStatus.value = !saveStatus.value;
                                }
                              },
                              child: SvgPicture.asset(
                                saveStatus.value
                                    ? AssetsConstants.saveActive
                                    : AssetsConstants.save,
                                width: 14.w,
                                height: 14.w,
                                color: saveStatus.value
                                    ? AppColor.primaryColor
                                    : AppColor.greyColor,
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
          ),
        ],
      ),
    );
  }
}
