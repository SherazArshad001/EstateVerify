import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/app_textfield.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/auth_button.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/auth_screen_text.dart';
import 'package:real_estate_app/feature/auth/presentation/widgets/optional_auth_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
              text: 'Log In',
            ),
            SizedBox(
              height: 20,
            ),
            AppAuthTextField(
              hintText: 'Email',
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
              text: 'Log In',
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            AuthRichText(
              text: "Don't have an account? ",
              tappableText: 'SignUp',
              onTap: () {
                context.go('/signup');
              },
            )
          ],
        ),
      ),
    );
  }
}
