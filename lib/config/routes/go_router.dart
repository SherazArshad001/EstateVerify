import 'package:go_router/go_router.dart';
import 'package:real_estate_app/feature/auth/presentation/pages/login_page.dart';
import 'package:real_estate_app/feature/auth/presentation/pages/signup_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
    ],
  );
}
