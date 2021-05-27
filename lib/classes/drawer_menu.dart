/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kus/screens/home_page.dart';
import 'package:kus/services/url_helper.dart';
/*--Services Import--*/
import '../services/bottom_modals.dart';
import '../services/authendication.dart';
/*--Utilities Import--*/
import '../utilities/styles.dart';
import '../utilities/elements.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(
              child: const Text(
                'Καλώς Ορίσατε!',
                style: drawerHeading,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.userLock,
              color: changePassIcon,
            ),
            title: const Text(
              'Αλλαγή Κωδικού Πρόσβασης',
              style: changePassText,
            ),
            onTap: () {
              updateUserPassModal(context);
            },
          ),
          //FAQs
          ListTile(
            leading: Icon(
              FontAwesomeIcons.questionCircle,
              color: changePassIcon,
            ),
            title: const Text(
              'FAQs',
              style: changePassText,
            ),
            onTap: () {
              launchURL('https://kus.gr/faq');
            },
          ),
          //Terms of Use
          ListTile(
            leading: Icon(
              FontAwesomeIcons.fileContract,
              color: changePassIcon,
            ),
            title: const Text(
              'Όροι Χρήσης',
              style: changePassText,
            ),
            onTap: () {
              launchURL('https://kus.gr/terms-of-use');
            },
          ),
          //Privacy Policy
          ListTile(
            leading: Icon(
              FontAwesomeIcons.userSecret,
              color: changePassIcon,
            ),
            title: const Text(
              'Πολιτική Απορρήτου',
              style: changePassText,
            ),
            onTap: () {
              launchURL('https://kus.gr/privacy-policy');
            },
          ),
          //Cookie Policy
          ListTile(
            leading: Icon(
              FontAwesomeIcons.cookie,
              color: changePassIcon,
            ),
            title: const Text(
              'Πολιτική Cookies',
              style: changePassText,
            ),
            onTap: () {
              launchURL('https://kus.gr/cookie-policy');
            },
          ),
          //Sign out
          ListTile(
            leading: Icon(
              FontAwesomeIcons.doorClosed,
              color: signOutIcon,
            ),
            title:const Text(
              'Αποσύνδεση',
              style: signOutText,
            ),
            onTap: () {
              signOut();
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
          ),
          drawerDivider(),
          //Delete Account
          ListTile(
            tileColor: delTileColor,
            leading: Icon(
              FontAwesomeIcons.trashAlt,
              color: deleteIcon,
            ),
            title: const Text(
              'Διαγραφή Λογαριασμού',
              style: deleteAccountText,
            ),
            onTap: () {
              deleteAccountModal(context);
            },
          ),
          drawerDivider(),
        ],
      ),
    );
  }
}
