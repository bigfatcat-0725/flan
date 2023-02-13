import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// default
// default + picture
// detail
// detail + picture
// 내 카드는 답변 수정, 삭제 가능
// 내가 질문해서 얻은 답이나 상대방의 질답 리스트들은 건드릴 수 없음.

class MainCard extends HookConsumerWidget {
  final String type;
  final Question data;
  const MainCard({
    super.key,
    required this.data,
    this.type = 'default',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    final likeStatus = useState(false);
    final saveStatus = useState(false);
    final tempProfileImg = useState(
        'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/linkagelab/20210521225127146gnfp.jpg');
    final myCard = useState(true);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state;

    // data 정리
    final String private = data.questions!.private as String;
    final String questionName = data.users!.nickname as String;
    final String questionContent = data.questions!.question as String;
    final int questinLikeCount = data.questions!.likes as int;
    final String answerProfileImg =
        data.questions!.answer![0].users!.photo as String;
    final String answerName =
        data.questions!.answer![0].users!.nickname as String;
    final String ago = data.questions!.answer![0].answers!.remaining as String;
    final String answerContent =
        data.questions!.answer![0].answers!.reply as String;

    // 좋아요 && 북마크 확인
    useEffect(() {
      // mount 상황이 아니라면 불러오지 않는다. 예기치 않는 오류 해결.
      if (isMounted()) {
        Future.microtask(() async {
          final status =
              await ref.read(profileControllerProvider.notifier).isLikeQuestion(
                    userSeq: userInfo!.userInfo!.seq as int,
                    questionSeq: data.questions!.seq as int,
                  );
          final bookmarkStatus = await ref
              .read(bookmarkControllerProvider.notifier)
              .isBookmarkQuestion(
                userSeq: userInfo.userInfo!.seq as int,
                seq: data.questions!.seq as int,
              );

          if (status == 1) {
            likeStatus.value = true;
          } else {
            likeStatus.value = false;
          }
          if (bookmarkStatus > 0) {
            saveStatus.value = true;
          } else {
            saveStatus.value = false;
          }
        });
      }
      return null;
    }, []);
    // 저장
    // seq 본인 확인
    final int isMyData =
        data.questions!.answer![0].answers!.userSeq == userInfo?.userInfo!.seq
            ? 1
            : 0;

    // 게시물 이미지
    final List<String> contentImgList = data.questions!.photo ?? [];

    return GestureDetector(
      onTap: () {
        context.push('/main_detail', extra: {'data': data});
      },
      child: Container(
        color: AppColor.scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 17.5.w,
                                    height: 17.5.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Q',
                                        style: AppTextStyle.defaultTextStyle
                                            .copyWith(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    private == '1' ? questionName : '익명',
                                    style:
                                        AppTextStyle.defaultTextStyle.copyWith(
                                      fontSize: 11.sp,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      questionContent,
                                      style:
                                          AppTextStyle.boldTextStyle.copyWith(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (contentImgList.isNotEmpty)
                          if (type == 'default')
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.w),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://files.heftykrcdn.com/wp-content/uploads/2017/11/c4ca4238a0b923820dcc509a6f75849b10.jpg',
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
                                      borderRadius: BorderRadius.circular(5.w),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+${contentImgList.length}',
                                        style:
                                            AppTextStyle.boldTextStyle.copyWith(
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
                  ),
                  if (contentImgList.isNotEmpty)
                    if (type == 'detail')
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 1.sw,
                              height: 80.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom: 10.h,
                                      right: index == 6 ? 0.w : 5.w,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.w),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://files.heftykrcdn.com/wp-content/uploads/2017/11/c4ca4238a0b923820dcc509a6f75849b10.jpg',
                                        width: 80.w,
                                        height: 80.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: answerProfileImg != ''
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                      imageUrl: tempProfileImg.value,
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
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                answerName,
                                style: AppTextStyle.boldTextStyle,
                              ),
                              SizedBox(height: 2.5.h),
                              Text(
                                ago,
                                style: AppTextStyle.hintStyle
                                    .copyWith(fontSize: 11.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      myCard.value
                          ? GestureDetector(
                              onTap: () {
                                showMore(context,
                                    type: 'not default',
                                    myData: isMyData,
                                    data: data);
                              },
                              child: Icon(
                                Icons.more_horiz,
                                size: 20.w,
                                color: AppColor.primaryColor,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 55.w),
                    child: Text(answerContent),
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
                      onTap: () {
                        ref
                            .read(profileControllerProvider.notifier)
                            .likeQuestion(
                              questionSeq: data.questions!.seq as int,
                              userSeq: userInfo!.userInfo!.seq as int,
                              ref: ref,
                            );
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 30.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              likeStatus.value
                                  ? AssetsConstants.heartActive
                                  : AssetsConstants.heart,
                              width: 12.5.w,
                              height: 12.5.w,
                              color: likeStatus.value
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                            ),
                            SizedBox(width: 7.5.w),
                            Text(
                              '$questinLikeCount',
                              style: AppTextStyle.greyStyle.copyWith(
                                fontSize: 11.sp,
                                color: likeStatus.value
                                    ? AppColor.primaryColor
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(profileControllerProvider.notifier)
                            .bookmarking(
                              page: 0,
                              question: data.questions!.seq as int,
                              user: userInfo!.userInfo!.seq as int,
                              ref: ref,
                            );
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
                  Expanded(
                    child: SizedBox(
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsConstants.share,
                            width: 12.5.w,
                            height: 12.5.w,
                          ),
                          SizedBox(width: 7.5.w),
                          Text(
                            '공유',
                            style: AppTextStyle.greyStyle.copyWith(
                              fontSize: 11.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
