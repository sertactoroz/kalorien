import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class AnimationOrange extends StatelessWidget {
  const AnimationOrange({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: LottieBuilder.network(
        "https://assets9.lottiefiles.com/packages/lf20_XpVCMJTSQt.json",
        width: 300,
        height: 300,
      ),
    );
  }
}
