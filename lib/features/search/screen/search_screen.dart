import 'package:contacts_service/contacts_service.dart';
import 'package:flan/apis/user_api.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/core/core.dart';
import 'package:flan/features/auth/controller/auth_controller.dart';
import 'package:flan/features/search/controller/search_controller.dart';
import 'package:flan/features/search/widget/recommend_card.dart';
import 'package:flan/models/user/user_model.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
    final recommendUserList = useState([]);
    final recommendStatus = useState(0);

    // 본인
    final userInfo = ref.watch(userInfoProvier.notifier).state!;

    final searchResult = useState(<UserInfo>[]);

    getPermission() async {
      final status = await Permission.contacts.status;
      if (status.isGranted) {
        if (kDebugMode) {
          print('연락처 접근 허용');
        }
        recommendStatus.value = 1;

        final contacts =
            await ContactsService.getContacts(withThumbnails: false);
        final phoneList = [];

        for (final data in contacts) {
          final phoneNumber = data.phones?.elementAt(0).value;
          phoneList.add(phoneNumber);
        }

        recommendUserList.value = await ref
            .read(searchControllerProvider.notifier)
            .recommendUser(
                seq: userInfo.userInfo!.seq as int,
                number: phoneList
                    .toString()
                    .substring(1, phoneList.toString().length - 1));
      } else if (status.isDenied) {
        if (kDebugMode) {
          print('연락처 접근 거절');
        }
        recommendStatus.value = 2;

        recommendUserList.value = await ref
            .read(searchControllerProvider.notifier)
            .recommendUser(seq: userInfo.userInfo!.seq as int, number: '');
      }
      if (status.isPermanentlyDenied) {
        if (kDebugMode) {
          print('연락처 접근 거절2');
        }
        recommendStatus.value = 3;
        recommendUserList.value = await ref
            .read(searchControllerProvider.notifier)
            .recommendUser(seq: userInfo.userInfo!.seq as int, number: '');
        // openAppSettings();
      }
    }

    useEffect(() {
      if (context.mounted) {
        if (bottomIndex == 2) {
          Future.microtask(() => getPermission());
        }
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
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 30.w, minHeight: 30.w),
                          suffixIcon: Visibility(
                            visible: searchStatus.value,
                            child: GestureDetector(
                              onTap: () {
                                searchStatus.value = false;
                                searchTextController.text = '';
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: SvgPicture.asset(
                                  AssetsConstants.clear,
                                  color: AppColor.primaryColor,
                                  width: 17.5.w,
                                  height: 17.5.w,
                                ),
                              ),
                            ),
                          ),
                          hintText: 'Vui lòng nhập nickname của bạn.',
                          hintStyle: AppTextStyle.hintStyle,
                        ),
                      ),
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
                            horizontal: 16.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'người bạn được giới thiệu',
                                style: AppTextStyle.boldTextStyle.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.refresh,
                              //     color: AppColor.primaryColor,
                              //     size: 20.w,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return RecommendCard(
                                  userInfo: recommendUserList.value[index],
                                );
                              },
                              itemCount: recommendUserList.value.length,
                            ),
                          ),
                        )
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
