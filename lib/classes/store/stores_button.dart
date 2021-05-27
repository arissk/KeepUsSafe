/*
Floating Action Button and Speed Dial Button
*/

/*--Packages Import--*/

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

/*--Classes Import--*/
import '../../services/provider.dart';
/*--Pages Import--*/
import 'package:kus/screens/store_registration_page.dart';

/*--Utilities Import--*/
import '../../utilities/styles.dart';

//Floating Action Button
class FabButton extends StatelessWidget {
  final IconData btnIcon;
  final Function onPress;
  final String tag;
  FabButton({@required this.btnIcon, @required this.onPress, this.tag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: globalButtonPressed,
      splashColor: globalButtonPressed,
      heroTag: tag,
      child: Icon(
        btnIcon,
        size: 15.0,
      ),
      onPressed: onPress,
    );
  }
}

class StoreButton extends StatefulWidget {
  @override
  _StoreButtonState createState() => _StoreButtonState();
}

final percentFilter = FilterBy();

class _StoreButtonState extends State<StoreButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterBy>(
      builder: (BuildContext context, percentFilter, Widget child) {
        return SpeedDial(
          foregroundColor: Colors.white,
          /*marginRight: MediaQuery.of(context).size.width / 2.5,
          marginBottom: 45,*/
          backgroundColor: colorMenuBgrnd,
          overlayColor: Colors.black,
          overlayOpacity: 0.6,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          curve: Curves.bounceIn,
          children: [
            //Add Review
            SpeedDialChild(
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 15.0,
                ),
                backgroundColor: globalButtonPressed,
                label: 'Προσθήκη Κριτικής',
                onTap: () {
                  Navigator.pushNamed(context, StoreRegistrationPage.id);
                }),
            //Order By Name
            SpeedDialChild(
                child: Icon(
                  FontAwesomeIcons.font,
                  color: Colors.white,
                  size: 15.0,
                ),
                backgroundColor: globalButtonPressed,
                label: 'Ταξινόμηση ανά Όνομα',
                onTap: () {
                  if (percentFilter.curPercentFilter == true) {
                    percentFilter.curPercentFilter = false;
                    percentFilter.getName(false);
                  } else {
                    percentFilter.getName(true);
                  }
                }),
            //Order By Percent
            /* SpeedDialChild(
                child: Icon(
                  FontAwesomeIcons.percent,
                  color: Colors.white,
                  size: 15.0,
                ),
                backgroundColor: globalButtonPressed,
                label: 'Ταξινόμηση ανά ποσοστό %',
                onTap: () {
                  if (percentFilter.curPercentFilter == true) {
                    percentFilter.curPercentFilter = false;
                    percentFilter.getPercent(false);
                  } else {
                    percentFilter.getPercent(true);
                  }
                }), */
            //Search Button
            /* SpeedDialChild(
                child: Icon(
                  FontAwesomeIcons.search,
                  size: 15.0,
                ),
                backgroundColor: globalButtonPressed,
                label: 'Αναζήτηση',
                onTap: () {
                  print('Search');
                }), */
          ],
        );
      },
    );
  }
}
