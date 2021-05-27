/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Checking if user is signed in
BuildContext context;
Future<void> isSignedIn() async {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

//Sign out
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
