import 'package:firebase_auth/firebase_auth.dart';

class User{
  String id;

  // ignore: deprecated_member_use
  User.fromFirebase(FirebaseUser user) {
    id = user.uid;
  }
  }