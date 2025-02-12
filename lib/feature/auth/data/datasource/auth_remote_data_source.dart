import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app/feature/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final firebaseUser = userCredential.user;
    if (firebaseUser == null) {
      throw Exception("Failed to log in");
    }
    return UserModel.fromFirebase(firebaseUser);
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    final user = userCredential.user;
    if (user == null) {
      throw Exception("Failed to sign up");
    }

    await user.updateDisplayName(name);
    await user.reload();

    final updatedUser = firebaseAuth.currentUser;
    if (updatedUser == null) {
      throw Exception("Failed to fetch updated user data");
    }

    return UserModel.fromFirebase(updatedUser);
  }
}
