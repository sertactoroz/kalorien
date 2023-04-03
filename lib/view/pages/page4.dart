import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/constants.dart';
import '../widgets/appbar_custom.dart';
import '../widgets/custom_button.dart';
import '../widgets/main_screen_headerwidget.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/png/profile.png'),
            ),
          ),
        ),
        HeaderWidget(),
        CustomButton1(
          text: 'Edit Profile',
          onPressed: () {},
          color: Colors.white,
          textColor: greenCustom,
        ),
        CustomButton1(
          text: 'Renew Plans',
          onPressed: () {},
          color: Colors.white,
          textColor: greenCustom,
        ),
        CustomButton1(
          text: 'Settings',
          onPressed: () {},
          color: Colors.white,
          textColor: greenCustom,
        ),
      ],
    ));
  }
}
