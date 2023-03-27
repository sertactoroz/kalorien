import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/constants.dart';

class AppbarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: greenCustom),
      title: Image.asset(
        'assets/png/kalorien.png',
        fit: BoxFit.cover,
        height: 20,
      ),
      backgroundColor: Colors.white,
    );
  }
}
