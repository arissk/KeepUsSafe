/*
Login page & functionality.
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

/*--Services Import--*/
//import '../services/bottom_modals.dart';

/*--Classes Import--*/
//import '../classes/text_button.dart';
import '../utilities/elements.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';

/*--Screen Import--*/
import '../screens/welcome_page.dart';

class LoginPage extends StatefulWidget {
  static const String id = "login_page";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Authendication
  final _auth = FirebaseAuth.instance;
  //User variables needed for the Authendication
  bool showLoading = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: SafeArea(
          child: Container(
            decoration: backgroundImage(),
            constraints: BoxConstraints.expand(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: sizedBoxSeperator(50.0),
                      ),
                    ],
                  ),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: logoImg(),
                      height: 150.0,
                    ),
                  ),
                  sizedBoxSeperator(40.0),
                  Center(
                    child: const Text(
                      'Γειά σας!',
                      style: registrationHeadingText,
                    ),
                  ),
                  sizedBoxSeperator(40.0),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Mail',
                      hintStyle: regFormText,
                      filled: true,
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: inputText,
                  ),
                  sizedBoxSeperator(20.0),
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
                      fillColor: globalColor,
                      contentPadding: EdgeInsets.only(left: 20.0),
                    ),
                    cursorColor: cursorColorWhite,
                    style: inputText,
                  ),
                  sizedBoxSeperator(20.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: globalColor,
                            padding:
                                EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              showLoading = true;
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                             if (user != null) {
                                Navigator.pushReplacementNamed(
                                    context, WelcomePage.id);
                              }
                            } catch (e) {                              
                              print(e);
                            }
                          },
                          child: Text(
                            "Είσοδος",
                            style: regBtnFormText,
                          ),
                        ),
                      ]),
                  sizedBoxSeperator(60.0),
                  Center(
                    child: const Text(
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
