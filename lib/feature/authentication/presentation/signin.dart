import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/authentication/businessinfo.dart';
import 'package:storekepper_desktop/feature/authentication/controller/authcontroller.dart';
import 'package:storekepper_desktop/feature/authentication/domain/model/profile.dart';
import 'package:storekepper_desktop/feature/authentication/presentation/store_selection.dart';
import 'package:storekepper_desktop/shared/extensions/buttons.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/constant/colors.dart';
import '../../../shared/widgets/textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebLogin(),
    );
  }
}

class WebLogin extends StatelessWidget {
  WebLogin({super.key});

  AuthController authController = Get.put(AuthController());
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

    return KeyboardListener(
        autofocus: true,
        focusNode: FocusNode(),
        child: Center(
            child: SizedBox(

          width: 400,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                mainAxisSize: MainAxisSize.min,

                children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                      kSizedbox5,
                      Text("Enter your credentials to access your account"),
                      kSizedbox20,
                  
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
                  ElevatedButton(
                      onPressed: () async {
                        email.text = "Sammedtwumasi2@gmail.com";
                        password.text = "Sammedtwumasi2@gmail.com";
                      },
                      child: Text('fill')),
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          focusNode: button,
                          onPressed: () async {
                            authController.loading.value = true;

                            Profile? results =
                                await authController.signIn(Profile(
                                    userid: 'userid',
                                    username: 'username',
                                    email: email.text.trim(),
                                    password: password.text.trim()));

                            if(results ==null){
                              showErrorSnackbar(message: "Sign-In not successfully");
                              authController.loading.value = false;
                            }else{
                              authController.loading.value = false;
                              Get.to(() => StoreSelectionScreen());
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          )).withLoading(loading: authController.loading),),
                ],
              ),
            ),
          ),
        )));
  }
}
