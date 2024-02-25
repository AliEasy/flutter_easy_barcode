import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/ui_constants.dart';
import 'package:flutter_svg/svg.dart';

// Widget dialogIconTitleWidget({
//   required String titleStr,
//   required BuildContext context,
//   Color color = AppColor.mainBlue,
//   IconData? icon,
//   String? svgPath,
//   Widget extraButtons = const SizedBox(
//     width: 0,
//     height: 0,
//   ),
//   Function? closeButtonEvent,
// }) {
//   return Directionality(
//     textDirection: TextDirection.rtl,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(dialogCorners),
//           topRight: Radius.circular(dialogCorners),
//         ),
//       ),
//       height: 50,
//       padding: const EdgeInsets.only(
//         top: 10,
//         bottom: 10,
//         right: 10,
//         left: 10,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Flexible(
//             flex: 1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 if (icon != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Icon(
//                       icon,
//                       color: color,
//                       size: 25,
//                     ),
//                   ),
//                 if (svgPath != null)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: SvgPicture.asset(
//                       svgPath,
//                       width: 25,
//                       height: 25,
//                     ),
//                   ),
//                 Expanded(
//                   child: MarqueeWidget(
//                     animate: true,
//                     child: Text(
//                       titleStr,
//                       style: TextStyle(
//                           color: color,
//                           fontFamily: "vazir_medium",
//                           fontSize: 17),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               extraButtons,
//               IconButton(
//                 padding: EdgeInsets.zero,
//                 splashRadius: 25,
//                 icon: const Icon(
//                   Icons.highlight_remove_rounded,
//                   color: AppColor.labelColorI,
//                   size: 25,
//                 ),
//                 onPressed: () {
//                   if (closeButtonEvent != null) {
//                     closeButtonEvent();
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 },
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

showDialogAnimatedAtBottom(
    {required BuildContext context,
    required Widget page,
    bool closable = true}) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return page;
    },
    transitionBuilder: (ctx, a1, a2, child) {
      return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(a1),
          child: child);
    },
    transitionDuration: const Duration(milliseconds: 500),
    barrierLabel: closable ? '' : null,
    barrierDismissible: closable,
  );
}
