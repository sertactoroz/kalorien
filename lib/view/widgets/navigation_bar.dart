// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../view_model/timeline_page_view_model.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.only(
//           top: 10.0,
//           left: 16.0,
//           right: 16.0,
//         ),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           for (int i = 0; i < icons.length; i++) iconButton(icons[i], i),
//         ]),
//       ),
//     );
//   }

//   List<String> icons = [
//     "assets/icons/home.png",
//     "assets/icons/search.png",
//     "assets/icons/add.png",
//     "assets/icons/reels.png",
//     "assets/profile.png",
//   ];

//   Widget iconButton(String icon, int index) => GestureDetector(
//         onTap: () {
//           context.read<TimelinePageViewModel>().setPage(index);
//         },
//         child: Opacity(
//           opacity:
//               context.watch<TimelinePageViewModel>().page == index ? 1.0 : 0.5,
//           child: Image.asset(
//             icon,
//             width: 72,
//             height: 28,
//           ),
//         ),
//       );
// }
