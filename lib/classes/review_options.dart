import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utilities/styles.dart';

class OptionText extends StatelessWidget {
  final String qText;
  final TextAlign tAlign;
  final Function scoreQ;
  //
  OptionText({
    @required this.qText,
    this.tAlign,
    this.scoreQ,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: ListTile(
        onTap: scoreQ,
       
        selectedTileColor: globalColor,
        leading: Icon(
          FontAwesomeIcons.virus,
          size: 30.0,
          color: globalColor,
        ),
        title: Text(
          qText,
          style: optionQuestionText,
          textAlign: tAlign,
        ),
      ),
    );
  }
}
