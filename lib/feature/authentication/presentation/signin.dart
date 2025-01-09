import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text("Email"),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              Text("Password"),
              TextBox(
                controller: passwordController,
                placeholder: 'Enter your password',
                obscureText: true,
              ),
              SizedBox(height: 20),
              Button(
                onPressed: () {
                  Get.toNamed('/store_selection');
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              HyperlinkButton(
                onPressed: () {
                  Get.toNamed('/sign_up');
                },
                child: Text('Don\'t have an account? Sign up'),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
