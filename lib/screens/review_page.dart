/*
Review Page: Show the Questions for the Review of the store
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kus/screens/welcome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:provider/provider.dart';
/*--Classes Import--*/
import '../utilities/elements.dart';
import '../classes/review_options.dart';
import '../classes/drawer_menu.dart';

//import '../classes/reviews/review_brain.dart';
import '../classes/app_bar.dart';
import '../services/provider.dart';
/*--Sreens Import--*/
import '../screens/welcome_page.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';

//Review & Options Data
List getOptionData = [
  {
    'question': 'Φορούσε μάσκες όλο το προσωπικό;',
    1: [
      {
        'option': 'Ναι όλοι',
        'score': 2,
      }
    ],
    2: [
      {
        'option': 'Όχι όλοι',
        'score': 1,
      }
    ],
    3: [
      {
        'option': 'Κανένας',
        'score': -1,
      }
    ],
    4: [
      {
        'option': 'Δε θυμάμαι',
        'score': 0,
      }
    ],
  },
  {
    'question': 'Οι μάσκες ήταν…',
    1: [
      {
        'option': 'Σωστές και σωστά φορεμένες',
        'score': 2,
      }
    ],
    2: [
      {
        'option': 'Σωστές αλλά φορεμένες με λάθος τρόπο (π.χ. με τη μύτη έξω)',
        'score': 1,
      }
    ],
    3: [
      {
        'option':
            'Λάθος (π.χ. διακοσμητική ασπίδα πηγουνιού, μάσκα με βαλβίδα)',
        'score': -1,
      }
    ],
    4: [
      {
        'option': 'Δε γνωρίζω',
        'score': 0,
      }
    ],
  },
  {
    'question': 'Το κατάστημα φρόντιζε να τηρούνται οι αποστάσεις ασφαλείας;',
    1: [
      {
        'option': 'Ναι',
        'score': 2,
      }
    ],
    2: [
      {
        'option': 'Όχι',
        'score': 1,
      }
    ],
    3: [
      {
        'option': 'Δε θυμάμαι',
        'score': 0,
      }
    ],
  },
  {
    'question': 'Υπήρχε αντισηπτικό;',
    1: [
      {
        'option': 'Ναι',
        'score': 2,
      }
    ],
    2: [
      {
        'option': 'Όχι',
        'score': 1,
      }
    ],
    3: [
      {
        'option': 'Δε γνωρίζω',
        'score': 0,
      }
    ],
  },
  {
    'question': 'Το κατάστημα επέτρεψε την είσοδο σε πελάτες χωρίς μάσκα;',
    1: [
      {
        'option': 'Ναι',
        'score': 1,
      }
    ],
    2: [
      {
        'option': 'Όχι',
        'score': 2,
      }
    ],
    3: [
      {
        'option': 'Δε γνωρίζω',
        'score': 0,
      }
    ],
  },
];

class ReviewPage extends StatefulWidget {
  static const String id = "review_page";
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

final reviewName = ReviewStoreName();

class _ReviewPageState extends State<ReviewPage> {
  /*--Variables--*/
  int _questionNum = 0;
  bool finalQuestion = false;
  int qPoint = 0;
  int score = 0;
  int numOfReviews = 0;

  /*--Functions--*/

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference stores = FirebaseFirestore.instance.collection('stores');
  //DocumentSnapshot documentSnapshot;

  //Register Store Function
  Future updateStoreData(
      String getStoreName, int getScore, int getReviewNum) async {
    try {
      //Check if store already exists
      stores
          .doc(getStoreName)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          //Update
          stores.doc(getStoreName).update({
            'score': documentSnapshot['score'] + getScore,
            'review_number': documentSnapshot['review_number'] + getReviewNum,
          }).then((_) {
            //print('success!');
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //Next Question
  void nextReview() {
    if (_questionNum < getOptionData.length - 1) {
      _questionNum++;
    }
  }

  //Function to check if the questions pool reaced the end
  bool qFinished() {
    if (_questionNum >= getOptionData.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //Reset Function
  void qReset() {
    _questionNum = 0;
    qPoint = 0;
    score = 0;
  }

  //Show Question
  String showReviewText() {
    //print('Store Score: $score');
    final reviewQ = getOptionData[_questionNum]['question'];
    return reviewQ;
  }

  //Create Option List
  Widget showOptions(String storeName) {
    List<Widget> optionsList = [];
    for (var i = 1; i < getOptionData[_questionNum].length; i++) {
      if (getOptionData[_questionNum][i][0] != null) {
        optionsList.add(
          OptionText(
            qText: getOptionData[_questionNum][i][0]['option'],
            tAlign: TextAlign.left,
            scoreQ: () {
              var point = getOptionData[_questionNum][i][0]['score'];
              setState(() {
                qPoint = point;
                score = score + qPoint;
                numOfReviews == 0
                    ? numOfReviews = 1
                    : numOfReviews = numOfReviews++;
              });

              //print('Store Score: $score');
              if (qFinished() == true) {
                //Update Data
                updateStoreData(storeName, score, numOfReviews);
              } /* else {
                print('Not ready to Update');
              } */
              getAnswer();
            },
          ),
        );
      }
    }
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: optionsList,
    );
  }

  //Get Answer and move next set of question. When finished show notification to user.
  void getAnswer() {
    // bool correctAnswer = getCorrectAnswer();
    setState(() {
      if (qFinished() == true) {
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          reverseAnimationCurve: Curves.easeIn,
          forwardAnimationCurve: Curves.easeIn,
          backgroundColor: globalColor,
          onStatusChanged: (FlushbarStatus status) {
            //print(status);
            if (status == FlushbarStatus.DISMISSED) {
              Navigator.pushReplacementNamed(context, WelcomePage.id);
            }
          },
          boxShadows: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0,
            )
          ],
          blockBackgroundInteraction: true,
          routeBlur: 5.0,
          routeColor: Color.fromRGBO(255, 255, 255, 0.5),
          isDismissible: true,
          duration: Duration(seconds: 5),
          icon: Icon(
            FontAwesomeIcons.check,
            color: Colors.white,
          ),
          mainButton: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, WelcomePage.id);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          showProgressIndicator: true,
          progressIndicatorBackgroundColor: globalColor,
          titleText: Text(
            'Ευχαριστούμε!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
              fontFamily: titleFont,
            ),
          ),
          messageText: Text(
            'Η κριτική σας προσθέθηκε με επιτυχία!',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: textFont,
            ),
          ),
        )..show(context);
        //Reset Review Questions
        qReset();
      } else {
        nextReview();
      }
    });
  }

  String currentStoreName = 'Όνομα Καταστήματος';

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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                sizedBoxSeperator(40.0),
                Consumer<ReviewStoreName>(
                  builder: (BuildContext context, reviewName, Widget child) {
                    return Text(
                      //currentStoreName,
                      reviewName.curStoreName,
                      style: smallTitle,
                    );
                  },
                ),
                smallHeadingDivider(),
                Text(
                  showReviewText(),
                  style: reviewQuestionText,
                  textAlign: TextAlign.center,
                ),
                smallHeadingDivider(),
                Expanded(
                  flex: 1,
                  child: Consumer<ReviewStoreName>(
                    builder: (BuildContext context, reviewName, Widget child) {
                      return showOptions(reviewName.curStoreName);
                    },
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
