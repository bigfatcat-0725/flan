import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/providers.dart';
import 'package:flan/core/util.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/features/drawer/controller/drawer_controller.dart';
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
    final saveStatus = useState(false);
    final isLike = useState(false);
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    useEffect(() {
      if (context.mounted) {
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

          if (context.mounted && status == 1) {
            isLike.value = true;
          } else {
            isLike.value = false;
          }
          if (context.mounted && bookmarkStatus == 1) {
            saveStatus.value = true;
          } else {
            saveStatus.value = false;
          }
        });
      }
      return null;
    }, [item]);
    // 위 item 을 인식하게 함으로써 완성.

    final List<String> contentImgList = (item.photo != "" && item.photo != null)
        ? item.photo.toString().split(',')
        : [];

    final tagList = item.tag!.split(',');

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 4.h,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push('/drawer_community_detail', extra: {
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
                                  userInfo.userInfo!.nickname.toString(),
                                  style: AppTextStyle.boldTextStyle.copyWith(
                                    fontSize: 11.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  item.remaining.toString(),
                                  style: AppTextStyle.hintStyle.copyWith(
                                    fontSize: 10.5.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                final myData =
                                    userInfo.userInfo!.seq == item.userSeq
                                        ? 1
                                        : 0;

                                drawerPageMore(
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.boldTextStyle.copyWith(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.content.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (contentImgList.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.w),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'http://topping.io:8855${contentImgList[0]}',
                                        width: 45.w,
                                        height: 45.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 45.w,
                                      height: 45.w,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(5.w),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+${contentImgList.length}',
                                          style: AppTextStyle.boldTextStyle
                                              .copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Wrap(
                      children: List.generate(
                        tagList.length,
                        (index) {
                          if (tagList[index] == '') {
                            return Container();
                          } else {
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(currentCategoryProvier.notifier)
                                    .onChange(tagList[index].toString());
                                context.push('/category');
                              },
                              child: Text(
                                '#${tagList[index]}',
                                style: AppTextStyle.hintStyle,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
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
                                          pageSeq: item.seq as int,
                                          userSeq:
                                              userInfo.userInfo!.seq as int,
                                        );
                                    if (res) {
                                      isLike.value = !isLike.value;
                                    }
                                    ref.invalidate(writtenProvider(
                                        userInfo.userInfo!.seq as int));
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
                                  item.commentCnt.toString(),
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
                                      page: item.seq as int,
                                      user: userInfo.userInfo!.seq as int,
                                      ref: ref,
                                    );
                                if (res) {
                                  saveStatus.value = !saveStatus.value;
                                }
                                ref.invalidate(writtenProvider(
                                    userInfo.userInfo!.seq as int));
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
