//Import Packages
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*--Classes Import--*/
import '../classes/buttons.dart';
/*--Services Import--*/
import '../services/url_helper.dart';
//import '../services/network_helper.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';
import '../utilities/elements.dart';
/*--Screen Import--*/
import 'login_page.dart';
import 'registration_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //Animation Variables
  AnimationController animationController;
  Animation animation;
  //Button Text Variables
  String loginButtonText = 'Είσοδος';
  String registestrationButtonText = 'Εγγραφή';
  bool isTextVisible = false;
  bool isAnimeVisible = true;

  //Init State
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    //Controler
    animationController.forward();
    animation = ColorTween(begin: Color(0xFF325A9F), end: Colors.white)
        .animate(animationController);
    //Animation Listener
    animationController.addListener(() {
      setState(() {});
    });
  }

  //Dispose
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //helper();
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Container(
          decoration: backgroundImage(),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: logoImg(),
                    height: 150.0,
                  ),
                ),
                sizedBoxSeperator(20.0),
                Visibility(
                  visible: isAnimeVisible,
                  child: SizedBox(
                    height: 30.0,
                    child: ScaleAnimatedTextKit(
                      duration: Duration(seconds: 1),
                      text: [
                        "Keep",
                        "Us",
                        "Safe",
                        "Keep Us Safe",
                      ],
                      repeatForever: false,
                      totalRepeatCount: 1,
                      textStyle: welcomeText,
                      textAlign: TextAlign.start,
                      onFinished: () {
                        setState(() {
                          isAnimeVisible = false;
                          isTextVisible = true;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: isTextVisible,
                  child: SizedBox(
                    height: 30.0,
                    child: Text(
                      'Keep Us Safe',
                      style: welcomeText,
                    ),
                  ),
                ),
                sizedBoxSeperator(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.doorClosed,
                          iconWidth: 100.0,
                          iconHeight: 100.0,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginPage.id);
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          loginButtonText,
                          style: buttonSubtext,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.userPlus,
                          iconWidth: 100.0,
                          iconHeight: 100.0,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RegistrationPage.id);
                          },
                        ),
                        sizedBoxSeperator(10.0),
                        Text(
                          registestrationButtonText,
                          style: buttonSubtext,
                        ),
                      ],
                    ),
                  ],
                ),
                sizedBoxSeperator(50.0),
                TextButton(
                  autofocus: false,
                  clipBehavior: Clip.none,
                  onPressed: () {
                    launchURL('https://kus.gr/privacy-policy');
                  },
                  child: const Text(
                    'Δεν ευθυνόμαστε για τις κριτικές που αναγράφονται! Διαβάστε περισσότερα...',
                    style: homeHintText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
