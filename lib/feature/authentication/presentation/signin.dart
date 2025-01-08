import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Text('Sign In'),
      content: Column(
        children: [
          TextBox(
            controller: emailController,
            placeholder: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
