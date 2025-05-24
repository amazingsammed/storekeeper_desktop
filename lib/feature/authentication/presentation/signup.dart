import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/constant/colors.dart';
import '../../../shared/widgets/textfield.dart';

// class SignUpScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldPage(
//       header: Text('Sign Up'),
//       content: Container(
//         width: 400,
//         height: 500,
//         alignment: Alignment.center,
//         child: Column(
//           children: [
//             TextBox(
//               controller: emailController,
//               placeholder: 'Enter your email',
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             TextBox(
//               controller: passwordController,
//               placeholder: 'Enter your password',
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton (
//               onPressed: () {
//                 // Handle sign up logic, then navigate
//                 Get.toNamed('/sign_in');
//               },
//               child: Text('Sign Up'),
//             ),
//             SizedBox(height: 20),
//             HyperlinkButton(
//               onPressed: () {
//                 Get.toNamed('/sign_in');
//               },
//               child: Text('Already have an account? Sign in'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebLogin(),
    );
  }
}

class WebLogin extends StatelessWidget {
  WebLogin({Key? key}) : super(key: key);

  RxBool isloading = false.obs;
  FocusNode username_node = FocusNode();
  FocusNode email_node = FocusNode();
  FocusNode password_node = FocusNode();
  FocusNode button = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      username_node.requestFocus();
    });

    return RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        onKey: (event) {
          // Check if the Enter Key is pressed
          if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
            /*  if(userid.hasFocus){
              password.requestFocus();
            }*/
          }
          // Check if Right Shift is also pressed
        },
        child: Center(
            child: Container(
          height: 500,
          width: 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  kSizedbox5,
                  const Text("Enter your credentials to register your account"),
                  kSizedbox20,
                  CustomTextField2(
                    controller: username,
                    focusNode: username_node,
                    onFieldSubmitted: (value) {
                      email_node.requestFocus();
                    },
                    icon: Icons.person,
                    label: 'Username',
                    color: Colors.blue,
                    onChanged: (value) {},
                  ),
                  kSizedbox20,
                  CustomTextField2(
                    controller: email,
                    focusNode: email_node,
                    onFieldSubmitted: (value) {
                      password_node.requestFocus();
                    },
                    icon: Icons.mail,
                    label: 'Email',
                    color: Colors.blue,
                    onChanged: (value) {},
                  ),
                  kSizedbox20,
                  CustomTextFieldPwd(
                    controller: password,
                    focusNode: password_node,
                    onFieldSubmitted: (value) {
                      button.requestFocus();
                    },
                    icon: Icons.lock,
                    label: 'Password',
                    color: Colors.blue,
                    onChanged: (value) {},
                  ),
                  kSizedbox10,
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/sign_in');
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                  kSizedbox10,
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          focusNode: button,
                          onPressed: () async {
                            var data = await authController.signUp(Profile(
                                userid: 'userid',
                                username: username.text,
                                email: email.text,
                                password: password.text));
                            print(data);
                          },
                          child: Text(
                            'Create account',
                            style: TextStyle(fontSize: 18),
                          ))),
                ],
              ),
            ),
          ),
        )));
  }
}
