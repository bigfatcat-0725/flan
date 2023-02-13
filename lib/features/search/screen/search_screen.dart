import 'package:flan/apis/user_api.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/search/controller/search_controller.dart';
import 'package:flan/features/search/widget/recommend_card.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController();
    final searchStatus = useState(false);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    // ref.listen(bottomNavProvier, (previous, next) {
    //   final page = ref.watch(bottomNavProvier.notifier).state;
    //   if (page == 2) {
    //     // search 페이지는 다른 곳 들렸다가 왔을 시 초기화 되어야 함.
    //     searchTextController.text = '';
    //     searchStatus.value = false;
    //     FocusManager.instance.primaryFocus?.unfocus();
    //   }
    // });

    final searchResult = useState(<UserInfo>[]);

    // void searchUser() async {
    //   searchResult.value = await ref
    //       .read(searchControllerProvider.notifier)
    //       .searchUser(
    //           user: userInfo.userInfo!.seq as int,
    //           search: searchTextController.text);
    // }
    //
    // useEffect(() {
    //   searchUser();
    // }, [searchResult.value]);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Container(
            color: AppColor.scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      searchStatus.value = true;
                    },
                    child: Container(
                      width: 1.sw,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onTap: () {
                          searchStatus.value = true;
                        },
                        onChanged: (value) async {
                          if (searchStatus.value &&
                              searchTextController.text != '') {
                            final data = await ref
                                .read(searchControllerProvider.notifier)
                                .searchUser(
                                  user: userInfo.userInfo!.seq as int,
                                  search: value,
                                );
                            searchResult.value = [...data];
                            print(searchResult.value);
                          } else {
                            searchResult.value = [];
                          }
                        },
                        controller: searchTextController,
                        cursorColor: AppColor.primaryColor,
                        style: AppTextStyle.defaultTextStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 30.w, minHeight: 30.w),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(10.w),
                            child: SvgPicture.asset(
                              AssetsConstants.search,
                              width: 15.w,
                              height: 15.w,
                              color: AppColor.greyColor,
                            ),
                          ),
                          hintText: '닉네임을 입력하세요',
                          hintStyle: AppTextStyle.hintStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Visibility(
                  visible: searchStatus.value,
                  child: GestureDetector(
                    onTap: () {
                      searchStatus.value = false;
                      searchTextController.text = '';
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: SvgPicture.asset(
                      AssetsConstants.clear,
                      color: AppColor.primaryColor,
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (searchStatus.value)
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Expanded(
                      child: ListView.builder(
                        // physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final user = searchResult.value[index];
                          return RecommendCard(userInfo: user);
                        },
                        itemCount: searchResult.value.length,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        Container(
                          color: AppColor.scaffoldBackgroundColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '추천친구',
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.refresh,
                                  color: AppColor.primaryColor,
                                  size: 20.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            // physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container();
                            },
                            itemCount: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 50.h,
                    color: AppColor.hintColor,
                    child: Center(
                      child: Text(
                        '광고',
                        style: AppTextStyle.defaultTextStyle.copyWith(
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
    );
  }
}
