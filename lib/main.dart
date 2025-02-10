import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/config/routes/go_router.dart';
import 'package:real_estate_app/core/theme/theme.dart';
import 'package:real_estate_app/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:real_estate_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:real_estate_app/feature/auth/domain/usecases/user_sign_up.dart';
import 'package:real_estate_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:real_estate_app/feature/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:real_estate_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Inject Dependencies
  final authRepository = AuthRepositoryImpl(
    authRemoteDataSource:
        AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance),
  );

  final logInUseCase = LogInUseCase(authRepository: authRepository);
  final signUpUseCase = SignUpUseCase(authRepository: authRepository);

  runApp(MyApp(
    logInUseCase: logInUseCase,
    signUpUseCase: signUpUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final LogInUseCase logInUseCase;
  final SignUpUseCase signUpUseCase;

  const MyApp({
    super.key,
    required this.logInUseCase,
    required this.signUpUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            logInUseCase: logInUseCase,
            signUpUseCase: signUpUseCase,
          ),
        ),
        BlocProvider(create: (context) => HomepageBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
      ),
    );
  }
}
