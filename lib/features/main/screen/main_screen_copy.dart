// import 'package:flan/core/core.dart';
// import 'package:flan/features/main/widget/main_card.dart';
// import 'package:flan/theme/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class MainScreen extends HookConsumerWidget {
//   const MainScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final list = useState([1, 2, 3, 4, 5, 6, 7, 8]);
//
//     return Scaffold(
//       backgroundColor: AppColor.scaffoldBackgroundColor,
//       body: list.value.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       // search 페이지로 이동.
//                       ref.read(bottomNavProvier.notifier).onChange(2);
//                     },
//                     child: Container(
//                       width: 100.w,
//                       height: 30.h,
//                       decoration: BoxDecoration(
//                         color: AppColor.primaryColor,
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Center(
//                         child: Text(
//                           '친구찾기',
//                           style: AppTextStyle.defaultTextStyle.copyWith(
//                             fontSize: 11.sp,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   Text(
//                     '익명으로 자유롭게 질문해보세요!',
//                     style: AppTextStyle.hintStyle,
//                   ),
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     // physics: const ClampingScrollPhysics(),
//                     itemCount: list.value.length,
//                     itemBuilder: (context, index) {
//                       return const MainCard();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
