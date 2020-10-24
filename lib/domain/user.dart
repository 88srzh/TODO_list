import 'package:firebase_auth/firebase_auth.dart';

class AuthUser{
  String id;

  // ignore: deprecated_member_use
  AuthUser.fromFirebase(FirebaseUser user) {
    id = user.uid;
  }
  }