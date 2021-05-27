/*
Store List page & functionality.
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';

/*--Classes Import--*/
import '../utilities/elements.dart';
import '../classes/app_bar.dart';
import '../classes/store/store_list.dart';
import '../classes/store/stores_button.dart';
import '../classes/drawer_menu.dart';

/*--Utilities Import--*/
import '../utilities/styles.dart';


class StoresPage extends StatefulWidget {
  static const String id = "stores_page";
  @override
  _StoresPageState createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(),
      drawer: DrawerMenu(),
      floatingActionButton: StoreButton(),
      body: SafeArea(
        child: Container(
          decoration: backgroundImage(),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   sizedBoxSeperator(40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        sizedBoxSeperatorW(80.0),
                        Expanded(
                          flex: 3,
                          child:const Text(
                            'Βρες κατάστημα',
                            style: smallTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: const Text(
                            'safe %',
                            style: smallHeadingText,
                          ),
                        ),
                      ],
                    ),
                    smallHeadingDivider(),
                    Container(
                      height: 600.0,
                      child: StoreList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
