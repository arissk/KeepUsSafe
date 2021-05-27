/*
---App Bar Class---
Contains the functions for the ApplicationBar
*/
/*--File Import--*/
/*--Packages Import--*/
import 'package:flutter/material.dart';

/*--Classes Import--*/
import '../utilities/elements.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';

class ApplicationBar extends AppBar {
  ApplicationBar({Widget title, context})
      : super(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/symbol_white.png',
                width: 30.0,
              ),
              sizedBoxSeperatorW(10.0),
              const Text('Keep Us Safe'),
            ],
          ),
          backgroundColor: globalColor,
        );
}
