/*
RegisterStore Model handles the store registration to Firebase
 */
/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*-- Screens Import--*/
import '../screens/review_page.dart';

//Register Store Functionality
class RegisterStore {
  String storeName;
  RegisterStore(this.context);
  BuildContext context;
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference stores = FirebaseFirestore.instance.collection('stores');
  //Register Store Function
  Future registerStore() async {
    try {
      stores
          .doc(storeName)
          .get()
          .then((DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          Navigator.pushReplacementNamed(context, ReviewPage.id);
        } else {
          if (storeName != null) {
            await stores.doc(storeName).set({
              'store_name': storeName,
              'score': 0,
              'review_number': 0,
            }).then((_) {
              print("success!");
            });
            //Navigate to Reviews Page
            Navigator.pushReplacementNamed(context, ReviewPage.id);
          } else if (storeName == '' || storeName == null) {
            print('No Store name!!');
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
