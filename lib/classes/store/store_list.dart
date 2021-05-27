/*--Packages Import--*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
/*--Services Import --*/
import '../../services/provider.dart';
/*--Utilities Import--*/
import '../../utilities/styles.dart';
/*--Classes Import--*/
import '../../utilities/elements.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

final percentFilter = FilterBy();

class _StoreListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) {
    //Stores Collection
    CollectionReference stores =
        FirebaseFirestore.instance.collection('stores');

    //Stream for Scores
    Stream storesCollectionStream = stores.snapshots();

    //Receive events when the document or query metadata changes
    FirebaseFirestore.instance
        .collection('stores').orderBy('store_name', descending: true)
        .snapshots(includeMetadataChanges: true);

    //Streams
    return StreamBuilder<QuerySnapshot>(
        stream: storesCollectionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if (snapshot.hasError) {
            return Text(
              'Δεν έχει προστεθεί κατάστημα!\nΠρόσθεσε το πρώτο! -> ${snapshot.error}',
            );
          } else {
            return Consumer<FilterBy>(
                builder: (BuildContext context, percentFilter, Widget child) {
              return ListView(
                reverse: percentFilter.curPercentFilter,
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  
                  //Variables
                  String storeName = document.data()['store_name'];
                  int storeScore = document.data()['score'];
                  int reviewNumber = document.data()['review_number'];
                  //
                  double showStoreScore = 100 * storeScore / reviewNumber / 10;
                  /*  stores.orderBy('$storeName',
                      descending: percentFilter.curPercentFilter); */

                  /* stores.orderBy('$showStoreScore',
                      descending: percentFilter.curPercentFilter); */
                  //Show the Data
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: showStoreScore >= 90
                                ? Image.asset(
                                    'assets/images/safe.png',
                                    height: 40.0,
                                  )
                                : showStoreScore >= 50
                                    ? Image.asset(
                                        'assets/images/half-safe.png',
                                        height: 40.0,
                                      )
                                    : Image.asset(
                                        'assets/images/not-safe.png',
                                        height: 40.0,
                                      ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                storeName,
                                style: listText,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${showStoreScore.toStringAsFixed(0)} %',
                              style: showStoreScore >= 90
                                  ? percentageTextGreen
                                  : showStoreScore >= 50
                                      ? percentageTextOrange
                                      : percentageTextRed,
                            ),
                          ),
                        ],
                      ),
                      listDivider(),
                    ],
                  );
                }).toList(),
              );
            });
          }
        });
  }
}
