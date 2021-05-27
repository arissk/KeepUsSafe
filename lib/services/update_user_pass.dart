/*--Packages Import--*/
import 'package:firebase_auth/firebase_auth.dart';
import '../services/authendication.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> updateUserPass(String newPassword) async {
  final firebaseUser = _auth.currentUser;
  firebaseUser.updatePassword(newPassword).then(
    (_) {
      //print('Password Changed for user: ${firebaseUser.email}');
      print('The new password is:  $newPassword');
      signOut();
    },
  ).catchError(
    (err) {
      print("Password can't be changed" + err.toString());
    },
  );
}
