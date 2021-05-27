/*
UserRegistration Model handles the user registration to Firebase
 */
/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
/*-- Screens Import--*/
import '../screens/login_page.dart';
/*--Utilities Import--*/
import '../utilities/styles.dart';

//User Registration
class UserRegistration {
  UserRegistration(this.context);
  BuildContext context;

  //Authendication
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //User variables needed for the Authendication
  bool showLoading = false;
  String firstname;
  String lastname;
  String email;
  String password;

  //Register User Function
  Future registerUser() async {
    try {
      //Add User data to Firebase Collection: users
      if (firstname != "" && lastname != "" && email != "" && password != "") {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        final firebaseUser = _auth.currentUser;
        _firestore.collection('users').doc(firebaseUser.uid).set({
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
        }).then((_) {
          print("success!");
        });

        if (newUser != null) {
          Navigator.pushReplacementNamed(context, LoginPage.id);
        }
      } else if (firstname == "") {
        Alert(
          context: context,
          title: "ΟΟΠΣ!",
          desc: 'Το πεδίο Όνομα είναι κενό!',
          buttons: [
            DialogButton(
              color: formColor,
              child: Text(
                "OK!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else if (lastname == "") {
        Alert(
          context: context,
          title: "ΟΟΠΣ!",
          desc: 'Το πεδίο Επίθετο είναι κενό!',
          buttons: [
            DialogButton(
              color: formColor,
              child: Text(
                "OK!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else if (email == "") {
        Alert(
          context: context,
          title: "ΟΟΠΣ!",
          desc: 'Το πεδίο Email είναι κενό ή λανθασμένο!',
          buttons: [
            DialogButton(
              color: formColor,
              child: Text(
                "OK!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      } else if (password == "" && password.length > 6) {
        Alert(
          context: context,
          title: "ΟΟΠΣ!",
          desc:
              'O Kωδικός Πρόσβασης πρέπει \nνα έχει το λιγότερο 6 χαρακτήρες!',
          buttons: [
            DialogButton(
              color: formColor,
              child: Text(
                "OK!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
      }
    } catch (e) {
      Alert(
        context: context,
        title: "ΟΟΠΣ!",
        desc: 'Ελεγξτε ότι όλα τα πεδία είναι συμπληρωμένα σωστά!',
        buttons: [
          DialogButton(
            color: formColor,
            child: Text(
              "OK!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      print(e);
    }
  }
}
