import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/bookmark/controller/bookmark_controller.dart';
import 'package:flan/features/profile/controller/profile_controller.dart';
import 'package:flan/models/bookmark/bookmark_question_model.dart';
import 'package:flan/models/feed/feed_model.dart';
import 'package:flan/models/home_feed/home_feed_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFeedCard extends HookConsumerWidget {
  final String type;
  final HomeFeedModel data;
  const HomeFeedCard({
    super.key,
    required this.data,
    this.type = 'default',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeStatus = useState(false);
    final saveStatus = useState(false);
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
      if (context.mounted) {
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

          if (likeStatus.hasListeners && status == 1) {
            likeStatus.value = true;
          } else {
            likeStatus.value = false;
          }
          if (saveStatus.hasListeners && bookmarkStatus > 0) {
            saveStatus.value = true;
          } else {
            saveStatus.value = false;
          }
        });
      }
      return null;
    }, [data]);
    // 저장
    // seq 본인 확인
    final int isMyData =
        data.questions!.answer![0].answers!.userSeq == userInfo?.userInfo!.seq
            ? 1
            : 0;

    // 게시물 이미지
    // 임시로 1
    final List<String> contentImgList =
        data.questions!.photo != null ? data.questions!.photo.split(',') : [];

    return GestureDetector(
      onTap: () {
        if (type != 'detail') {
          context.push('/home_main_detail', extra: {'data': data});
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 4.h,
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
                                      maxLines: type != 'detail' ? 2 : 100,
                                      overflow: type == 'detail'
                                          ? null
                                          : TextOverflow.ellipsis,
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              contentImgList.length,
                              (index) => Container(
                                    width: 1.sw,
                                    height: 140.h,
                                    margin: EdgeInsets.only(
                                      bottom: 10.h,
                                      right: contentImgList[
                                                  contentImgList.length - 1] ==
                                              contentImgList[index]
                                          ? 0.w
                                          : 10.w,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'http://topping.io:8855${contentImgList[index]}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // 혹시나 피드가 생겨서 다른 사람의 답변한 새질문 등을 사용하는 곳이 온다면..
                              ref.read(feedSeqProvider.notifier).onChange(
                                  data.questions!.answer![0].users!.seq as int);
                              ref.read(bottomNavProvier.notifier).onChange(3);
                            },
                            child: Container(
                              width: 45.w,
                              height: 45.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: answerProfileImg != ''
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'http://topping.io:8855$answerProfileImg',
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
                      type != 'detail'
                          ? GestureDetector(
                              onTap: () {
                                showMoreHomeCard(
                                  context,
                                  type: 'not default',
                                  myData: isMyData,
                                  data: data,
                                  ref: ref,
                                );
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 55.w),
                        child: Text(
                          answerContent,
                          maxLines: type != 'detail' ? 3 : 100,
                          overflow:
                              type == 'detail' ? null : TextOverflow.ellipsis,
                        ),
                      ),
                      if (data.questions!.answer![0].answers!.photo != '')
                        if (type == 'default')
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.w),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'http://topping.io:8855${data.questions!.answer![0].answers!.photo}',
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
                                  // child: Center(
                                  //   child: Text(
                                  //     '+${contentImgList.length}',
                                  //     style:
                                  //         AppTextStyle.boldTextStyle.copyWith(
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            if (data.questions!.answer![0].answers!.photo != '')
              if (type == 'detail')
                Padding(
                  padding: EdgeInsets.only(
                    left: 55.w + 16.w,
                    right: 16.w,
                    bottom: 16.w,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.w),
                        child: CachedNetworkImage(
                          imageUrl:
                              'http://topping.io:8855${data.questions!.answer![0].answers!.photo}',
                          width: 1.sw,
                          height: 150.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
            if (type != 'detail')
              Container(
                width: 1.sw,
                height: 25.h,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final res = await ref
                              .read(profileControllerProvider.notifier)
                              .likeQuestion(
                                questionSeq: data.questions!.seq as int,
                                userSeq: userInfo!.userInfo!.seq as int,
                                ref: ref,
                              );
                          if (res) {
                            likeStatus.value = !likeStatus.value;
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 25.h,
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
                        onTap: () async {
                          final res = await ref
                              .read(profileControllerProvider.notifier)
                              .questionBookmarking(
                                question: data.questions!.seq as int,
                                user: userInfo!.userInfo!.seq as int,
                                ref: ref,
                              );
                          if (res) {
                            saveStatus.value = !saveStatus.value;
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 25.h,
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
                      child: GestureDetector(
                        onTap: () {
                          showDefaultDialog(context, '서비스 준비중입니다.');
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 25.h,
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
                    ),
                  ],
                ),
              ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
