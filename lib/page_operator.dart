import 'package:example/view/pages/page1.dart';
import 'package:example/view/pages/page2.dart';
import 'package:example/view/pages/page3.dart';
import 'package:example/view/pages/page4.dart';
import 'package:example/view/pages/page5.dart';
import 'package:example/view/widgets/appbar_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants/constants.dart';

import 'animated_notch/src/models/bottom_bar_item_model.dart';
import 'animated_notch/src/notch_bottom_bar.dart';
import 'main.dart';

class PageOperator extends StatefulWidget {
  const PageOperator({Key? key}) : super(key: key);

  @override
  State<PageOperator> createState() => _PageOperatorState();
}

class _PageOperatorState extends State<PageOperator> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 5;

  /// widget list
  List<Widget> get bottomBarPages => [
        Page1(),
        Page2(),
        Page3(onPageChange: () {
          _pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        }),
        Page4(),
        Page5(),
      ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: greenCustom,
              bottomBarItems: [
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 1',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/search_icon.svg',
                    color: Colors.blueGrey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/search_icon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 4',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}
