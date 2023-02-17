import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/community/controller/community_controller.dart';
import 'package:flan/models/comment/comment_model.dart';
import 'package:flan/models/page/page_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunityCommentEdit extends HookConsumerWidget {
  final PageModel page;
  final CommentModel comment;
  const CommunityCommentEdit({
    Key? key,
    required this.page,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictures = useState(<File>[]);
    final picturesCurIndex = useState(1);
    final askTextController =
        useTextEditingController(text: comment.comment!.reply.toString());
    final askNode = useFocusNode();
    final img = useState(
        'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/linkagelab/20210521225127146gnfp.jpg');
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    useEffect(() {
      askNode.requestFocus();
      return null;
    });

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: UIConstants.qaAppBar(context, '댓글수정'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Container(
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
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.community,
                          width: 17.5.w,
                          height: 17.5.w,
                          color: AppColor.primaryColor,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          page.pages!.private == 1
                              ? page.users!.nickname.toString()
                              : '익명',
                          style: AppTextStyle.defaultTextStyle.copyWith(
                            fontSize: 11.sp,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          page.pages!.remaining.toString(),
                          style: AppTextStyle.hintStyle.copyWith(
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      page.pages!.title.toString(),
                      style: AppTextStyle.boldTextStyle.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      page.pages!.content.toString(),
                      style: AppTextStyle.defaultTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: !(userInfo.userInfo!.photo == '' ||
                            userInfo.userInfo!.photo == null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'http://topping.io:8855${userInfo.userInfo!.photo}',
                              placeholder: (context, text) {
                                return SvgPicture.asset(
                                  AssetsConstants.noImg,
                                );
                              },
                              width: 35.w,
                              height: 35.w,
                              fit: BoxFit.cover,
                            ),
                          )
                        : SvgPicture.asset(
                            AssetsConstants.noImg,
                            width: 35.w,
                            height: 35.w,
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: askTextController,
                            focusNode: askNode,
                            cursorColor: AppColor.primaryColor,
                            maxLines: null,
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontSize: 13.sp,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '답변을 입력하세요.',
                              hintStyle: AppTextStyle.hintStyle.copyWith(
                                fontSize: 13.sp,
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
          if (pictures.value.isEmpty)
            Container()
          else
            CarouselSlider(
              options: CarouselOptions(
                height: 150.h,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  picturesCurIndex.value = index + 1;
                },
              ),
              items: pictures.value.map((i) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 1.sw,
                      child: Image.file(
                        i,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 7.5.w,
                      left: 7.5.w,
                      child: Container(
                        width: 40.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.w,
                            color: AppColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            '${picturesCurIndex.value} / ${pictures.value.length}',
                            style: AppTextStyle.boldTextStyle.copyWith(
                              color: AppColor.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7.5.w,
                      right: 7.5.w,
                      child: GestureDetector(
                        onTap: () {
                          pictures.value.removeAt(picturesCurIndex.value - 1);
                          // 다시 담아줘야 state 변경함.
                          pictures.value = [...pictures.value];
                          picturesCurIndex.value = picturesCurIndex.value - 1;
                        },
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: FittedBox(
                            child: SvgPicture.asset(
                              AssetsConstants.clear,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).padding.bottom + 50.h,
        child: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await pickCamera();
                        if (image != null) {
                          pictures.value.add(image);
                          pictures.value = [...pictures.value];
                        }
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.camera,
                        width: 22.5.w,
                        height: 22.5.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: () async {
                        final images = await pickImages();
                        if (images.isNotEmpty) {
                          // 계속 추가
                          pictures.value = [...pictures.value, ...images];
                        }
                      },
                      child: SvgPicture.asset(
                        AssetsConstants.picture,
                        width: 22.5.w,
                        height: 22.5.w,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 질문 수정
                        ref
                            .read(communityControllerProvider.notifier)
                            .editComment(
                              user: userInfo.userInfo!.seq as int,
                              commentSeq: comment.comment!.seq as int,
                              pageSeq: page.pages!.seq as int,
                              reply: askTextController.text,
                              ref: ref,
                              context: context,
                            );
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '수정',
                                style: AppTextStyle.defaultTextStyle.copyWith(
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              SvgPicture.asset(
                                AssetsConstants.share,
                                width: 15.w,
                                height: 15.w,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
