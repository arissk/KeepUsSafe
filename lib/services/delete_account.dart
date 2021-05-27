/*--Packages Import--*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> deleteAccount() async {
  try {
    await _auth.currentUser.delete();
    //print('User Account Deleted');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      //print('The user must reauthenticate before this operation can be executed.');
    }
  }
}

Future<void> deleteUserInfo() async {
  final firebaseUser = _auth.currentUser;
  return users
      .doc(firebaseUser.uid)
      .delete()
      .then((value) => print("User Info Deleted"))
      .catchError(
        (error) => print("Failed to delete user: $error"),
      );
}
