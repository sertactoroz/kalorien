import 'package:flutter/cupertino.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Column(
          children: [
            Text(
              "Hello Omer Faruk",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Find track and eat healthy food")
          ],
        ));
  }
}