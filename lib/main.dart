//Import Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//Import Classes
import 'services/provider.dart';
//Import Screens
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/registration_page.dart';
import 'screens/stores_page.dart';
import 'screens/store_registration_page.dart';
import 'screens/review_page.dart';
import 'screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KuS());
}

class KuS extends StatelessWidget {
  @override
  //Build Method
  Widget build(BuildContext context) {
    //Only Portrait Orientation
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.portraitUp,
    ]);

    //Material widget.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReviewStoreName>(
            create: (_) => ReviewStoreName()),
        ChangeNotifierProvider<FilterBy>(create: (_) => FilterBy()),
      ],
      child: MaterialApp(
        initialRoute: HomePage.id,
        //debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id: (context) => HomePage(),
          LoginPage.id: (context) => LoginPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          StoresPage.id: (context) => StoresPage(),
          StoreRegistrationPage.id: (context) => StoreRegistrationPage(),
          ReviewPage.id: (context) => ReviewPage(),
          WelcomePage.id: (context) => WelcomePage(),
        },
      ),
    );
  }
}
