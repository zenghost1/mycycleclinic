import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BMServiceListModel.dart';
import '../repositories/stores_repository.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';
import '../utils/BMDataGenerator.dart';
import 'BMServiceComponent.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import 'BMServiceComponent2.dart';

final _firebase = FirebaseFirestorePlatform.instance;

class BMOurServiveComponent extends StatefulWidget {
  String storeUid;

  BMOurServiveComponent({required this.storeUid});

  @override
  State<BMOurServiveComponent> createState() => _BMOurServiveComponentState();
}

class _BMOurServiveComponentState extends State<BMOurServiveComponent> {
  late String storeid;
  late Future<List<BMServiceListModel>> servicesList;
  late Future<List<dynamic>> accessoriesList;
  // late Future<List<BMServiceListModel>> bikepartsList;
  // late Future<List<BMServiceListModel>> bikesList;
  // late Future<List> accessoriesname;
  @override
  void initState() {
    super.initState();
    storeid = widget.storeUid;
    servicesList = StoresRepository.getServicesList(storeid);
    // accessoriesList =
    //     StoresRepository.getAccessoriesList(storeid, "Accessories");
    // bikepartsList = StoresRepository.getBikepartsList(storeid);
    // bikesList = StoresRepository.getBikesList(storeid);
  }

  // Future<String>
  // getList(String name, String id) async {
  //   List sbname = [];
  //   var doc = await _firebase
  //       .collection("stores")
  //       .doc(id)
  //       .collection("menus")
  //       .doc("Subnames")
  //       .collection("name")
  //       .doc(name)
  //       .get()
  //       .then((value) {
  //     for (int i = 0; i < value.get("types").length; i++) {
  //       sbname.add(value.get("types")[i]);
  //     }
  //   });
  //   print(sbname);
  //   return FutureBuilder(
  //     future: sbname,
  //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {},
  //   );
  // }
  bool collapse = true;

  getbuilder(String n, String id) {
    return ExpansionTile(
        collapsedIconColor: bmSpecialColorDark,
        iconColor: bmSpecialColorDark,
        title: titleText(title: n, size: 24),
        children: [
          StreamBuilder(
              stream: _firebase.collection("subnames").doc(n).snapshots(),
              builder: (context, snapshot) {
                var doc = snapshot.data?.get(id);
                //print(doc as List);
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: doc.length,
                      itemBuilder: (context, i) {
                        //
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            collapsedIconColor: bmSpecialColorDark,
                            iconColor: bmSpecialColorDark,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            title: titleText(title: '${doc[i]}', size: 22),
                            //  Row(
                            //     children: [
                            //       Text(
                            //         "${doc[i]}",
                            //         style: TextStyle(
                            //             fontSize: 20,
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ],
                            //   ),
                            children: [
                              //SizedBox(height: 10),
                              StreamBuilder<QuerySnapshotPlatform>(
                                  stream: _firebase
                                      .collection("stores")
                                      .doc(id)
                                      .collection("menus")
                                      .snapshots(),
                                  builder: (context, innershot) {
                                    final messages = innershot.data?.docs;
                                    List<BMServiceComponent> messagewidget = [];
                                    if (messages != null) {
                                      for (var message in messages) {
                                        final name =
                                            message.data()?["itemName"] ?? "";
                                        final cost = message.get("itemPrice");
                                        final imageurl =
                                            message.get("itemImage");
                                        final subname = message.get("subname");
                                        // final dis = message.get("itemDescription");

                                        //   messagewidget.add({
                                        //     "name": name1,
                                        //     "cost": cost,
                                        //     "imageurl": imageurl,
                                        //     "subname": subname
                                        //   });
                                        // }
                                        print(name);
                                        if (subname == doc[i]) {
                                          messagewidget.add(BMServiceComponent(
                                              name: name,
                                              cost: cost,
                                              imageurl: imageurl));
                                        }
                                      }
                                    }

                                    //print(messagewidget);
                                    if (innershot.hasData) {
                                      return Column(
                                        children: messagewidget,
                                      );
                                    } else if (innershot.hasError) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                        ),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                        ),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
              }),
        ]);
  }

  getbuilder2(list, String name) {
    return FutureBuilder<List<BMServiceListModel>>(
      future:
          list, // Assuming recommendedList is of type Future<List<BMCommonCardModel>>
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Data is available, map and display the list
          return Column(
            mainAxisSize: MainAxisSize.min,
            //title: titleText(title: name, size: 24),
            children: snapshot.data!.map((e) {
              return BMServiceComponent2(element: e);
            }).toList(),
          );
        } else if (snapshot.hasError) {
          // Error occurred while fetching data
          return Text('Error: ${snapshot.error}');
        } else {
          // Data is still loading
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // getList("Accessories", "Jw05mBpXnk9ydGaJh0p0");
    print(storeid);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        titleText(title: 'Services', size: 24),
        //16.height,
        getbuilder2(servicesList, 'Services'),
        //16.height,
        //titleText(title: 'Accessories', size: 24),

        getbuilder("Accessories", storeid.toString()),
        // getList("Accessories", "Jw05mBpXnk9ydGaJh0p0"),
        //16.height,
        //titleText(title: 'Bike parts', size: 24),
        //5.height,
        getbuilder("Bikeparts", storeid.toString()),
        // getbuilder(bikepartsList),
        //16.height,
        getbuilder("Bikes", storeid.toString())
        //titleText(title: 'Bikes', size: 24),
        //16.height,
        // getbuilder(bikesList),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}

// getName(String name, String id) {
//
//   return FutureBuilder(builder: (context,sna))
// }
// _firebase
//     .collection("stores")
// .doc(id)
// .collection("menus")
// .doc("Subnames")
// .collection("name").doc(name)
