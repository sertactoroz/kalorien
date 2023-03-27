// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:kalorientracker/view/pages/login_screen.dart';
// import 'package:kalorientracker/view/pages/register_screen.dart';

// import '../pages/home_screen.dart';

// class CustomButton extends StatefulWidget {
//   const CustomButton({super.key});

//   @override
//   State<CustomButton> createState() => _LoginRegisterButton();
// }

// class _LoginRegisterButton extends State<CustomButton> {
//   late TextEditingController usernameController;
//   late TextEditingController passwordController;
//   @override
//   void initState() {
//     usernameController =
//         TextEditingController(text: "umutcanbostanci@gmail.com");
//     passwordController = TextEditingController(text: "12345678");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _textField(usernameController, "Username"),
//           _textField(passwordController, "Password"),
//           const SizedBox(
//             height: 10,
//           ),
//           _button(() async {
//             // FirebaseAuth auth = FirebaseAuth.instance;
//             try {
//               // UserCredential credential =
//               //     await auth.signInWithEmailAndPassword(
//               //         email: usernameController.text,
//               //         password: passwordController.text);
//               // print(credential);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HomeScreen()));
//             } catch (e) {
//               print(e.toString());
//             }
//           }, "Login"),
//           const SizedBox(
//             height: 20,
//           ),
//           GestureDetector(

//             child: const Text('Register'),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _textField() =>

//   Widget _button(Function() onPressed, String text) {
//     //
//     //
//     // return SizedBox(
//     //     height: 42,
//     //     child: OutlinedButton(
//     //       onPressed: onPressed,
//     //       child: Text(text),
//     //     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  minimumSize: Size(50, 75) // put the width and height you want
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
