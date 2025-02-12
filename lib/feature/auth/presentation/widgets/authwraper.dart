import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/feature/auth/presentation/pages/login_page.dart';
import 'package:real_estate_app/feature/navigation/presentation/pages/bottom_nav.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    
    return user == null ? const LoginPage() : BottomNavScreen();
  }
}
