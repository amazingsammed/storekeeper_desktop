
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/constant/colors.dart';
import '../../../shared/widgets/textfield.dart';

// class SignInScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Spacer(),
//               Text("Email"),
//               TextField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: 20),
//               Text("Password"),
//               TextBox(
//                 controller: passwordController,
//                 placeholder: 'Enter your password',
//                 obscureText: true,
//               ),
//               SizedBox(height: 20),
//               Button(
//                 onPressed: () {
//                   Get.toNamed('/store_selection');
//                 },
//                 child: Text('Sign In'),
//               ),
//               SizedBox(height: 20),
//               HyperlinkButton(
//                 onPressed: () {
//                   Get.toNamed('/sign_up');
//                 },
//                 child: Text('Don\'t have an account? Sign up'),
//               ),
//               Spacer()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
  FocusNode email_node = FocusNode();
  FocusNode password_node = FocusNode();
  FocusNode button = FocusNode();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      email_node.requestFocus();
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
              child:   Card(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomTextField2(
                        controller: email,
                        focusNode: email_node,
                        onFieldSubmitted: (value) {
                          password_node.requestFocus();
                        },
                        icon: Icons.person,
                        label: 'Email',
                        color: Colors.blue,
                        onChanged: (value) {},

                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: TextButton(

                          onPressed: () {
                            Get.toNamed('/sign_up');
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      kSizedbox10,
                      SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                              focusNode: button,
                              onPressed: () async {
                                final supabase = Supabase.instance.client;
                                var response=  await supabase.auth.signInWithPassword(
                                    email: email.text,
                                    password: password.text,

                                );
                                print(response.user);

                              },
                              child: Text('Login',style: TextStyle(fontSize: 18),)
                          )),


                    ],
                  ),
                ),
              ),
            )));
  }
}