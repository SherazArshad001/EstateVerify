import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/core/validator/validator.dart';
import 'package:real_estate_app/feature/auth/presentation/bloc/auth_bloc.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthSuccess || current is AuthFailure,
      listener: (context, state) {
        if (state is AuthSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/home');
          });
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
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
                  validator: AuthValidator.validateName,
                ),
                SizedBox(
                  height: 10,
                ),
                AppAuthTextField(
                  hintText: 'Your Email',
                  controller: emailController,
                  validator: AuthValidator.validateEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                AppAuthTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                  validator: AuthValidator.validatePassword,
                ),
                SizedBox(
                  height: 20,
                ),
                AuthButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(SignupEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                    }
                  },
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
        ),
      ),
    );
  }
}
