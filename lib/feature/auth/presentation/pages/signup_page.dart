import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/app_textfield.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/auth_button.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/auth_screen_text.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/optional_auth_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthLogInText(
              text: 'Sign Up',
            ),
            SizedBox(
              height: 20,
            ),
            AppAuthTextField(
              hintText: 'Your Name',
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            AppAuthTextField(
              hintText: 'Your Email',
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            AppAuthTextField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            AuthButton(
              text: 'Sign Up',
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            AuthRichText(
              text: "Already have an account? ",
              tappableText: 'Log In',
              onTap: () {
                context.go('/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
