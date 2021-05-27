/*--Packages Import--*/
import 'package:flutter/material.dart';
/*--Utilities Import--*/
import 'styles.dart';

//Logo
Image logoImg() {
  return Image.asset('assets/images/symbol_blue.png');
}

//Background Image
BoxDecoration backgroundImage() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/appbg.png'),
      fit: BoxFit.cover,
    ),
  );
}

//sizedBoxSeperator Vertical
SizedBox sizedBoxSeperator(double boxHeight) {
  return SizedBox(
    height: boxHeight,
  );
}

//sizedBoxSeperator Horizontal
SizedBox sizedBoxSeperatorW(double boxWidth) {
  return SizedBox(
    width: boxWidth,
  );
}
//Heading Divider
Divider headingDivider() {
  return Divider(
    color: globalColor,
    thickness: 0.8,
    height: 100.0,
  );
}
//Heading Divider
Divider smallHeadingDivider() {
  return Divider(
    color: globalColor,
    thickness: 0.8,
    height: 50.0,
  );
}
Divider listDivider() {
  return Divider(
    color: globalColor,
    thickness: 0.8,
    height: 40.0,
  );
}
Divider drawerDivider() {
  return Divider(
    color: colorAnthax,
    thickness: 0.3,
    height: 8.0,
  );
}

