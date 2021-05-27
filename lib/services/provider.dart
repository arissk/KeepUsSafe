/*
Provider: This file has the method of for the provider in order to get the data across the app.
*/

//Method for storing the review name and shown also to the review Page.
import 'package:flutter/material.dart';

class ReviewStoreName extends ChangeNotifier {
  String curStoreName;
  String get nameOfStore => curStoreName;

  void getReviewStoreName(String nameOfStore) {
    curStoreName = nameOfStore;
    notifyListeners();
  }
}

//Method for sorting the store list by the percentage score
class FilterBy extends ChangeNotifier {
  bool curPercentFilter = true;
  bool get filterPercent => curPercentFilter;
  //Filter data by store name
  void getName(bool filterPercent) {
    curPercentFilter = filterPercent;
    notifyListeners();
    
  }
  //Filter data by percent
  void getPercent(bool filterPercent) {
    curPercentFilter = filterPercent;
    notifyListeners();
    
  }

}

