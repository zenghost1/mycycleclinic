import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BMServiceListModel.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

final _firebase = FirebaseFirestorePlatform.instance;

User? loggineduser;

class BMServiceComponent extends StatefulWidget {
  BMServiceListModel element;

  BMServiceComponent({required this.element});

  @override
  State<BMServiceComponent> createState() => _BMServiceComponentState();
}

class _BMServiceComponentState extends State<BMServiceComponent> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getuser();
  }

  // Future<int?> fetch(String name) async {
  //   int add = 0;
  //   var doc = await _firebase
  //       .collection("cart")
  //       .doc("${loggineduser?.email}")
  //       .collection("cart")
  //       .get();
  //   DocumentSnapshotPlatform foundDoc =
  //       doc.docs.firstWhere((element) => element.get("name") == name);
  //   if (foundDoc.exists == true) {
  //     setState(() {
  //       add = 1;
  //     });
  //     return add;
  //   } else {
  //     setState(() {
  //       add = 0;
  //     });
  //     return add;
  //   }
  //
  //   // print(foundDoc.get("name"));
  // }

  void getuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggineduser = user;
        print(loggineduser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(45)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(title: widget.element.name, size: 14, maxLines: 2),
              12.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RS.${widget.element.cost}',
                    style: secondaryTextStyle(
                      color: bmPrimaryColor,
                      size: 12,
                    ),
                  ),
                  16.width,
                  // Text(
                  //   element.time,
                  //   style: secondaryTextStyle(
                  //     color:bmPrimaryColor,
                  //     size: 12,
                  //   ),
                  // ),
                ],
              )
            ],
          ).expand(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bmPrimaryColor.withAlpha(50),
                  borderRadius: radius(100),
                  border: Border.all(color: bmPrimaryColor),
                ),
                padding: EdgeInsets.all(6),
                child: Icon(Icons.info, color: bmPrimaryColor),
              ),
              8.width,
              AppButton(
                width: 60,
                padding: EdgeInsets.all(0),
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Text('ADD',
                    // fetch(widget.element.name) == 1 ? 'ADDED' : 'ADD',
                    style: boldTextStyle(color: Colors.white, size: 12)),
                color: bmPrimaryColor,
                onTap: () {
                  var snackBar = SnackBar(
                    dismissDirection: DismissDirection.down,
                    content: Text(
                      'Your Item is added to the Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                  // showBookBottomSheet(context, element);
                  print(widget.element.image);
                  _firebase
                      .collection("cart")
                      .doc("${loggineduser?.email}")
                      .collection("cart")
                      .doc("${widget.element.name}")
                      .set({
                    'cost': widget.element.cost.toDouble(),
                    'count': 1,
                    'imageurl': widget.element.image,
                    'name': widget.element.name
                  }).then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(snackBar)
                          });
                },
              ),
            ],
          )
        ],
      ).paddingSymmetric(vertical: 8),
    );
  }
}
