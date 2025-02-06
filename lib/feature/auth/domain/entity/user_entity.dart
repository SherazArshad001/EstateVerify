import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String id;
  final String email;
  final String name;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserEntity.fromFirebase(User firebaseUser) {
    return UserEntity(
      id: firebaseUser.uid,
      email: firebaseUser.email!,
      name: firebaseUser.displayName!,
    );
  }
}
