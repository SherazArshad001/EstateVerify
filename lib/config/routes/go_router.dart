import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_app/feature/auth/presentation/pages/login_page.dart';
import 'package:real_estate_app/feature/auth/presentation/pages/signup_page.dart';
import 'package:real_estate_app/feature/homepage/presentation/pages/homepge.dart';
import 'package:real_estate_app/feature/navigation/presentation/pages/bottom_nav.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return '/login';
      }

      if (state.fullPath == '/login' || state.fullPath == '/signup') {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'bottomNav',
        builder: (context, state) => BottomNavScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
