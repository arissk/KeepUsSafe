/*
Round Icon Button: A button that is round with an icon inside. 
*/
/*--Packages Import--*/
//import 'dart:html';

import 'package:flutter/material.dart';
import '../utilities/styles.dart';

//Round Icon Button
class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon,
      @required this.onPressed,
      this.iconSize,
      this.iconHeight,
      this.iconWidth});

  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final double iconWidth;
  final double iconHeight;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: iconSize,
        color: globalColor,
      ),
      onPressed: onPressed,
      //elevation: 5.0,
      constraints: BoxConstraints.tightFor(
        //tightFor
        width: iconWidth,
        height: iconHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(100.0),
        side: BorderSide(
          color: globalColor,
        ),
      ),
      splashColor: globalButtonPressed,
    );
  }
}
