import 'package:example/page_operator.dart';
import 'package:example/providers/user_provider.dart';
import 'package:example/register_screen.dart';
import 'package:example/view/widgets/animation_orange.dart';
import 'package:example/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginRegisterButton();
}

class _LoginRegisterButton extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    usernameController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationOrange(),

                _textField(usernameController, "Username"),
                _textField(passwordController, "Password"),
                const SizedBox(
                  height: 10,
                ),
                CustomButton1(
                    text: 'Login',
                    color: greenCustom,
                    textColor: Colors.white,
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          await userProvider.signInUser(UserModel(
                              email: usernameController.text,
                              password: passwordController.text));
                          if (userProvider.result == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PageOperator()));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Yay! A SnackBar!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          ));
                        }
                      } catch (e) {
                        print("null");
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const RegisterScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text('Register'),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Column(
                //   children: [FruitSearchBar()],
                // )
              ],
            ),
          )),
    );
  }

  Widget _textField(TextEditingController controller, String label) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      );
}

class UserCredential {}
