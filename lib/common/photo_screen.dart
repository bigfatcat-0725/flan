import 'package:cached_network_image/cached_network_image.dart';
import 'package:flan/constants/constants.dart';
import 'package:flan/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhotoScreen extends HookConsumerWidget {
  final String img;
  const PhotoScreen({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 1.sw,
            height: 20.h,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: EdgeInsets.only(
              left: 16.w,
            ),
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                color: Colors.transparent,
                child: SvgPicture.asset(
                  AssetsConstants.back,
                  width: 15.h,
                  height: 15.h,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 20.h + MediaQuery.of(context).padding.top),
              child: CachedNetworkImage(
                imageUrl: img,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
