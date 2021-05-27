/*
This file includes all the screens modals.
 */
/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:kus/screens/home_page.dart';
/*--Classes Import--*/

/*--Services Import--*/
import '../services/delete_account.dart';
import '../services/update_user_pass.dart';
/*--Utilities Import--*/
import '../utilities/styles.dart';
import '../utilities/elements.dart';

//Login Warnings
Future<void> showLoginWarningsModal(BuildContext context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: globalColor,
          child: Column(
            children: [
             const Text('Το Email ή το Password είναι κενό ή λανθασμένο!'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('OK'),
                    onPressed: () {
                      updateUserPass(password);
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      });
}

//Update User Password
var password;
Future<void> updateUserPassModal(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        color: globalColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Για να αλλάξετε το password σας, συμπληρώστε το παρακάτω πεδίο.',
                style: modalBottomText,
                textAlign: TextAlign.center,
              ),
              sizedBoxSeperator(20.0),
              //Password Textfield
              TextField(
                obscureText: true,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Κωδικός',
                  hintStyle: regFormText,
                  filled: true,
                  fillColor: colorAnthax,
                  contentPadding: EdgeInsets.only(left: 20.0),
                ),
                cursorColor: cursorColorWhite,
                style: regFormText,
              ),
              sizedBoxSeperator(6.0),
              Text(
                'Ο κωδικός πρέπει να έχει τουλάχιστον 6 χαρακτήρες!',
                style: hintInfoWhite,
              ),

              sizedBoxSeperator(36.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Ενημέρωση'),
                    onPressed: () {
                      updateUserPass(password);
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Ακύρωση'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

//Delete User Account
Future<void> deleteAccountModal(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        color: globalColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Θέλετε να διαγράψετε το λογαριασμό σας;',
                style: modalBottomText,
                textAlign: TextAlign.center,
              ),
              sizedBoxSeperator(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Ναι'),
                    onPressed: () {
                      deleteUserInfo();
                      deleteAccount();
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text('Όχι'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
