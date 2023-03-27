import 'package:example/view/pages/main_screen.dart';
import 'package:example/view/widgets/main_screen_bottomwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_custom.dart';
import '../widgets/custom_slider.dart';
import '../widgets/percent_indicator.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderWidget(),
        PieChartWidget(),
        MiddleWidget(),
        BottomWidget(),
      ],
    ));
  }
}
