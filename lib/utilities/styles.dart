/*
The styles for widgets in the app
*/
/*--Packages Import--*/
import 'dart:ui';

import 'package:flutter/material.dart';

/* Generic */
//Colors
const globalColor = Color(0xFF325A9F);
const globalButtonPressed = Color(0xFFD8415A);
const formColor = Color(0xFF325A9F);
const regFormColor = Color(0xFFFFFFFF);
const logFormColor = Color(0xFFFFFFFF);
const cursorColorWhite = Color(0xFFFFFFFF);
const colorAnthax = Color(0xFF333333);
//Buttons Background
//Button on Store list page
const colorMenuBgrnd = Color(0xFFE04172);
/* Drawer Styles */

//Change Pass Styles
//Icon
const changePassIcon = Color(0xFF325A9F);
const changePassText = TextStyle(
  fontFamily: titleFont,
  fontSize: 15.0, //50.0
  fontWeight: FontWeight.bold,
  color: colorAnthax,
);
//Sign Out Styles
//Icon
const signOutIcon = Color(0xFFA30058);
const signOutText = TextStyle(
  fontFamily: titleFont,
  fontSize: 15.0, //50.0
  fontWeight: FontWeight.bold,
  color: colorAnthax,
);

//Delete Account Styles

//Icon
const deleteIcon = Color(0xFFDC143C);

//Tile Color
const delTileColor = Color(0xFF333333);

//Text Color
const delTextColor = Color(0xFFFFFFFF);
const deleteAccountText = TextStyle(
  fontFamily: titleFont,
  fontSize: 15.0, //50.0
  fontWeight: FontWeight.bold,
  color: delTextColor,
);

//Texts
const String titleFont = 'Nexa';
const String textFont = 'Gotham';

//App Bar Logo Text
const appLogoText = TextStyle(
  fontFamily: titleFont,
  fontSize: 30.0, //50.0
  fontWeight: FontWeight.bold,
  color: formColor,
);
//Forms Text
const formText = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: formColor,
);
//Hint info
const hintInfo = TextStyle(
  fontFamily: textFont,
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: colorAnthax,
);
//Hint info white
const hintInfoWhite = TextStyle(
  fontFamily: textFont,
  fontSize: 12.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);


//Home Hint Text Info
const homeHintText = TextStyle(
  fontFamily: textFont,
  fontSize: 14.0,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  color: globalButtonPressed,
);
/* Headings */
//Drawer Heading
const drawerHeading = TextStyle(
  fontFamily: textFont,
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: globalColor,
);

//Headings 1 - Text
const headingText = TextStyle(
  fontFamily: textFont,
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: globalColor,
);
//Headings 2 - Text
const smallHeadingText = TextStyle(
  fontFamily: textFont,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: globalColor,
);

//Headings Small Title
const smallTitle = TextStyle(
  fontFamily: textFont,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: globalColor,
);
/* Texts */
//Body Text
const bodyText = TextStyle(
  fontFamily: textFont,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

//Sub Text
const subText = TextStyle(
  fontFamily: textFont,
  fontSize: 14.0,
  fontStyle: FontStyle.italic,
);

//List Text
const listText = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: globalColor,
);

//Green Text
const percentageTextGreen = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: Colors.green,
  fontWeight: FontWeight.w500,
);

//Orange Text
const percentageTextOrange = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: Colors.orange,
  fontWeight: FontWeight.w500,
);

//Red Text
const percentageTextRed = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: Colors.red,
  fontWeight: FontWeight.w500,
);


//Info Text
const infoText = TextStyle(
  fontFamily: textFont,
  fontSize: 18.0,
  fontStyle: FontStyle.italic,
);

//Modal Bottom Text
const modalBottomText = TextStyle(
  fontFamily: textFont,
  fontSize: 18.0,
  fontStyle: FontStyle.italic,
  color: Colors.white,
);

//Screen Text
const screenText =
    TextStyle(fontFamily: textFont, fontSize: 45.0, letterSpacing: 2.0);

/* Home Page  */
//Welcome Text
const welcomeText = TextStyle(
  fontFamily: titleFont,
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  color: globalColor,
);
//Login Button
const buttonSubtext = TextStyle(
  fontFamily: textFont,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

/* Login Page  */

//Text Button
const textBtnContainerColor = Color(0xFF325A9F);
const textBtnContainerHeight = 80.0;
const btnTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: globalColor,
);
const inputText = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: logFormColor,
);

//Registration Buttons
const btnTextRegStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: globalColor,
);

/* Registration Page  */

//RegistrationHeadings Text
const registrationHeadingText = TextStyle(
  fontFamily: textFont,
  fontSize: 28.0,
  color: Color(0xFF325A9F),
);

//Registration Forms Text
const regFormText = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: regFormColor,
);
//Registration Forms Text
const regBtnFormText = TextStyle(
  fontFamily: textFont,
  fontSize: 16.0,
  color: regFormColor,
);

/* Review Page  */

//Review Question - Text
const reviewQuestionText = TextStyle(
  fontFamily: textFont,
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
  color: globalColor,
);
//Review Option - Text
const optionQuestionText = TextStyle(
  fontFamily: textFont,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
