/*
Review Page: store registration to the firebase database.
*/

/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:kus/classes/store_registration.dart';
import 'package:dropdownfield/dropdownfield.dart';

/*--Services Import--*/
import '../services/suggest_store.dart';

/*--Classes Import--*/
import '../utilities/elements.dart';
import '../classes/app_bar.dart';
import '../services/provider.dart';
import '../classes/drawer_menu.dart';
/*--Utilities Import--*/
import '../utilities/styles.dart';

class StoreRegistrationPage extends StatefulWidget {
  static const String id = "store_registration";
  @override
  _StoreRegistrationPageState createState() => _StoreRegistrationPageState();
}

class _StoreRegistrationPageState extends State<StoreRegistrationPage> {
  bool showLoading = false;
  bool dropdownEnabled = true;

  final reviewName = ReviewStoreName();
  StoreSuggestion storeNameList = StoreSuggestion();

  @override
  void initState() {
    storeNameList.pStores();
    super.initState();
  }

  @override
  void dispose() {
    
    storeNameList.pStores();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Call The list Of Stores
    //Import Store Registration Model
    RegisterStore storeRegistration = RegisterStore(context);
    return Scaffold(
      appBar: ApplicationBar(),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Container(
          decoration: backgroundImage(),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    sizedBoxSeperator(90.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Hero(
                            tag: 'Κατάστημα',
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.store,
                                size: 90.0,
                                color: globalColor,
                              ),
                            ),
                          ),
                        ),
                        //Store Name Textfield
                      ],
                    ),
                    sizedBoxSeperator(20.0),
                    const Text(
                      'Εισαγετε το όνομα του καταστήματος.',
                      style: subText,
                    ),
                    sizedBoxSeperator(20.0),
                    TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        storeRegistration.storeName = value;
                        //print('Typed text: $value');
                      },
                      decoration: InputDecoration(
                        hintText: 'Όνομα Καταστήματος',
                        hintStyle: regFormText,
                        filled: true,
                        fillColor: globalColor,
                        contentPadding: EdgeInsets.only(left: 20.0),
                      ),
                      cursorColor: cursorColorWhite,
                      style: regFormText,
                    ),
                    sizedBoxSeperator(20.0),
                    const Text(
                      'ή επιλεξτέ το από τη λίστα.',
                      style: subText,
                    ),
                    sizedBoxSeperator(20.0),
                    DropDownField(
                      enabled: dropdownEnabled,
                      strict: false,
                      itemsVisibleInDropdown: 4,
                      textStyle: listText,
                      hintText: 'Επιλέξτε Κατάστημα',
                      hintStyle: formText,
                      items: storeNameList.storeNames,
                      onValueChanged: (value) {
                        storeRegistration.storeName = value;
                        //print('Typed text: $value');
                      },
                    ),
                    sizedBoxSeperator(50.0),
                    Consumer<ReviewStoreName>(
                      builder:
                          (BuildContext context, reviewName, Widget child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: globalColor,
                            padding:
                                EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              showLoading = true;
                            });
                            reviewName.getReviewStoreName(
                                storeRegistration.storeName);
                            storeRegistration.registerStore();
                          },
                          child: Text("Συνέχεια", style: regBtnFormText),
                        );
                      },
                    ),
                  ],
                ),
                sizedBoxSeperator(60.0),
                Center(
                  child:const Text(
                    '#staysafe',
                    style: registrationHeadingText,
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
