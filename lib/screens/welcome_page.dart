/*
Welcome page & functionality.
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
/*--Classes Import--*/
import '../utilities/elements.dart';
import '../classes/app_bar.dart';
import '../classes/buttons.dart';
import '../classes/drawer_menu.dart';

/*--Pages Import--*/
import '../screens/stores_page.dart';
import 'store_registration_page.dart';
/*--Utilities Import--*/
import '../utilities/styles.dart';

class WelcomePage extends StatefulWidget {
  static const String id = "welcome_page";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          decoration: backgroundImage(),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: sizedBoxSeperator(20.0),
                ),
                Expanded(
                  flex: 2,
                  child: ImgButton(
                    img: 'assets/images/find_shop.png',
                    onTap: () {
                      Navigator.pushNamed(context, StoresPage.id);
                    },
                  ),
                ),
                sizedBoxSeperator(10.0),
                const Text(
                  'Βρες μαγαζί',
                  style: smallHeadingText,
                ),
                Expanded(
                  flex: 1,
                  child: sizedBoxSeperator(40.0),
                ),
                Expanded(
                  flex: 2,
                  child: ImgButton(
                    img: 'assets/images/rating.png',
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, StoreRegistrationPage.id);
                    },
                  ),
                ),
                sizedBoxSeperator(10.0),
                const Text(
                  'Γράψε κριτική',
                  style: smallHeadingText,
                ),
                Expanded(
                  flex: 1,
                  child: sizedBoxSeperator(20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
