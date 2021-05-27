/*
Text Button: A button that is text 
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';

/*--Utilities Import--*/
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

//Custom Button
class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {@required this.onTap,
      @required this.buttonTitle,
      @required this.buttonColor});

  final Function onTap;
  final String buttonTitle;
  final buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: buttonColor,
          ),
        ),

        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        //width: double.infinity,
        height: textBtnContainerHeight,
      ),
    );
  }
}

//Image Button
class ImgButton extends StatelessWidget {
  ImgButton({@required this.onTap, @required this.img});

  final Function onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        img,
        height: 150.0,
      ),
    );
  }
}
