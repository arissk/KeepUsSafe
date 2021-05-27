/*
This file suggest store name that already exist to the user.
*/
/*--Packages Import--*/
//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Stores Collection
CollectionReference stores = FirebaseFirestore.instance.collection('stores');

//Stream for Scores
Stream storesCollectionStream = stores.snapshots();

class StoreSuggestion {
//Stores Collection
  List<String> storeNames = [];
  //
  void pStores() {
    storeNames.clear();
    stores.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            storeNames.add(doc['store_name']);
          }),
        });
  }
}
