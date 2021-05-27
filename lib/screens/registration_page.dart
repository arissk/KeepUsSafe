/*
User registration page & functionality.
*/
/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:kus/classes/user_registration.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

/*--Classes Import--*/
//import '../classes/text_button.dart';
import '../utilities/elements.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = "registration_page";
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    //Import User Registration Model
    UserRegistration usrRegistration = UserRegistration(context);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: usrRegistration.showLoading,
        child: SafeArea(
          child: Container(
            decoration: backgroundImage(),
            // decoration: backgroundImage(),
            constraints: BoxConstraints.expand(),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: logoImg(),
                      height: 90.0,
                    ),
                  ),
                  sizedBoxSeperator(50.0),
                  Center(
                    child: const Text(
                      'Γειά σας!',
                      style: registrationHeadingText,
                    ),
                  ),
                  sizedBoxSeperator(40.0),
                  //Firstname Textfield
                  TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      usrRegistration.firstname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Όνομα.',
                      hintStyle: regFormText,
                      filled: true,
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: regFormText,
                  ),
                  sizedBoxSeperator(20.0),
                  //Lastname Textfield
                  TextField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      usrRegistration.lastname = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Επίθετο.',
                      hintStyle: regFormText,
                      filled: true,
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: regFormText,
                  ),
                  sizedBoxSeperator(20.0),
                  //Email Textfield
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      usrRegistration.email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Mail',
                      hintStyle: regFormText,
                      filled: true,
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: regFormText,
                  ),
                  sizedBoxSeperator(20.0),
                  //Password Textfield
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      usrRegistration.password = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Κωδικός',
                      hintStyle: regFormText,
                      helperText:
                          'Ο κωδικός πρέπει να έχει τουλάχιστον 6 χαρακτήρες!',
                      helperStyle: hintInfo,
                      filled: true,
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: regFormText,
                  ),
                  sizedBoxSeperator(36.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: globalColor,
                          padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            usrRegistration.showLoading = true;
                          });
                          usrRegistration.registerUser();
                        },
                        child: Text("Εγγραφή", style: regBtnFormText),
                      ),
                    ],
                  ),
                  sizedBoxSeperator(60.0),
                  Center(
                    child:const Text(
                      '#staysafe',
                      style: registrationHeadingText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
