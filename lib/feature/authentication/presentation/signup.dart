import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: Text('Sign Up'),
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
              // Handle sign up logic, then navigate
              Get.toNamed('/sign_in');
            },
            child: Text('Sign Up'),
          ),
          SizedBox(height: 20),
          HyperlinkButton(
            onPressed: () {
              Get.toNamed('/sign_in');
            },
            child: Text('Already have an account? Sign in'),
          ),
        ],
      ),
    );
  }
}