import 'package:contacts_service/contacts_service.dart';
import 'package:flan/apis/user_api.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
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
import 'package:permission_handler/permission_handler.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = useTextEditingController();
    final searchStatus = useState(false);
    final bottomIndex = ref.watch(bottomNavProvier);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    final searchResult = useState(<UserInfo>[]);

    getPermission() async {
      //(주의) Android 11버전 이상과 iOS에서는 유저가 한 두번 이상 거절하면 다시는 팝업 띄울 수 없습니다.
      final status = await Permission.contacts.status;
      if (status.isGranted) {
        print('허락됨');
        final contacts =
            await ContactsService.getContacts(withThumbnails: false);
        final phoneList = [];

        for (final data in contacts) {
          final phoneNumber = data.phones?.elementAt(0).value;
          phoneList.add(phoneNumber);
        }

        print(
            phoneList.toString().substring(1, phoneList.toString().length - 1));

        // 요렇게 해서 보내기.
        // 허락 상태면 추천친구.
      } else if (status.isDenied) {
        // 거절 상태면 설정 버튼 놓고 연락처 접근 허용 받기.
        print('거절됨');
      }
      if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }

    useEffect(() {
      if (bottomIndex == 2) {
        Future.microtask(() => getPermission());
      }
      return null;
    }, []);

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
                            // print(searchResult.value);
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
                ],
              ),
            ),
        ],
      ),
    );
  }
}
