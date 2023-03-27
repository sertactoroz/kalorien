import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_screen_custombutton.dart';

class MiddleWidget extends StatelessWidget {
  const MiddleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 143, 86, 171),
      ),
      child: Row(
        children: const [
          SizedBox(
            width: 30,
          ),
          SizedBox(
              width: 130,
              child: Text(
                "Track Your Weekly Progress",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
          SizedBox(
            width: 10,
          ),
          CustomButton()
        ],
      ),
    );
  }
}