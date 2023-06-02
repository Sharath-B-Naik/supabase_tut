// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:qkwic/constants/app_icons.dart';
// import 'package:qkwic/widgets/app_text.dart';

// class AppBackButton extends StatelessWidget {
//   final VoidCallback? onTap;
//   const AppBackButton({super.key, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ?? () => Navigator.of(context).pop(),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             AppIcons.arrowback,
//             height: 14.h,
//           ),
//           SizedBox(width: 5.w),
//           const AppText(
//             "Back",
//             fontSize: 14,
//           ),
//         ],
//       ),
//     );
//   }
// }
