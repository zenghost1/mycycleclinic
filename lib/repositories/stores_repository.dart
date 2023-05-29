import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class StoresRepository {
  static Future<List<BMCommonCardModel>> getStoresList() async {
    List<BMCommonCardModel> storesList = [];

    // Fetch data from Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('stores').get();

    // Process each document in the query snapshot
    querySnapshot.docs.forEach((doc) {
      String title = doc.data()['storeName'] ?? '';

      String subtitle = doc.data()['address'] ?? '';

      String storeUid = doc.data()['storeUid'] ?? '';

      String image = doc.data()['storeAvatarUrl'] ?? '';

      // double distance = doc['distance'].toDouble();
      String distance = "0.00";

      bool saveTag = false;

      BMCommonCardModel cardModel = BMCommonCardModel(
        storeUid: storeUid,
        title: title,
        subtitle: subtitle,
        image: image,
        distance: distance,
        saveTag: saveTag,
      );

      storesList.add(cardModel);
    });

    return storesList;
  }

  // StreamBuilder<QuerySnapshot>(
  //           stream: FirebaseFirestore.instance
  //               .collection("sellers")
  //               .doc(widget.model!.sellerUID)
  //               .collection("menus")
  //               .doc(widget.model!.menuID)
  //               .collection("items")
  //               .orderBy("publishedDate", descending: true)
  //               .snapshots(),

  static Future<List<BMServiceListModel>> getServicesList(
      String storeUid, String name) async {
    List<BMServiceListModel> storesList = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('stores')
        .doc(storeUid)
        .collection("menus")
        .where("itemCategory", isEqualTo: "services")
        .where("subname", isEqualTo: name)
        .get();

    querySnapshot.docs.forEach((doc) {
      String name = doc.data()['itemName'] ?? '';

      int cost = doc.data()['itemPrice'] ?? '';

      String description = doc.data()['itemDescription'] ?? '';

      String image = doc.data()['itemImage'] ?? '';
      String subname = doc.data()["subname"] ?? "";

      BMServiceListModel cardModel = BMServiceListModel(
        name: name,
        cost: cost,
        description: description,
        image: image,
        subname: subname,
      );

      storesList.add(cardModel);
    });

    return storesList;
  }

  static Future<List<dynamic>> getAccessoriesList(
      String storeUid, String name) async {
    List<BMServiceListModel> storesList = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('stores')
        .doc(storeUid)
        .collection("menus")
        .where("itemCategory", isEqualTo: "accessories")
        .where("subname", isEqualTo: name)
        .get();

    querySnapshot.docs.forEach((doc) {
      String name = doc.data()['itemName'] ?? '';

      int cost = doc.data()['itemPrice'] ?? '';

      String description = doc.data()['itemDescription'] ?? '';

      String image = doc.data()['itemImage'] ?? '';
      String subname = doc.data()["subname"] ?? "";

      BMServiceListModel cardModel = BMServiceListModel(
        name: name,
        cost: cost,
        description: description,
        image: image,
        subname: subname,
      );

      storesList.add(cardModel);
    });

    return storesList;
  }

  static Future<List<BMServiceListModel>> getBikepartsList(
      String storeUid, String name) async {
    List<BMServiceListModel> storesList = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('stores')
        .doc(storeUid)
        .collection("menus")
        .where("itemCategory", isEqualTo: "bikeparts")
        .where("subname", isEqualTo: name)
        .get();

    querySnapshot.docs.forEach((doc) {
      String name = doc.data()['itemName'] ?? '';

      int cost = doc.data()['itemPrice'] ?? '';

      String description = doc.data()['itemDescription'] ?? '';

      String image = doc.data()['itemImage'] ?? '';
      String subname = doc.data()["subname"] ?? "";
      BMServiceListModel cardModel = BMServiceListModel(
        name: name,
        cost: cost,
        description: description,
        image: image,
        subname: subname,
      );

      storesList.add(cardModel);
    });

    return storesList;
  }

  static Future<List<BMServiceListModel>> getBikesList(
      String storeUid, String name) async {
    List<BMServiceListModel> storesList = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('stores')
        .doc(storeUid)
        .collection("menus")
        .where("itemCategory", isEqualTo: "bikes")
        .where("subname", isEqualTo: name)
        .get();

    querySnapshot.docs.forEach((doc) {
      String name = doc.data()['itemName'] ?? '';

      int cost = doc.data()['itemPrice'] ?? '';

      String description = doc.data()['itemDescription'] ?? '';

      String image = doc.data()['itemImage'] ?? '';
      String subname = doc.data()["subname"] ?? "";

      BMServiceListModel cardModel = BMServiceListModel(
        name: name,
        cost: cost,
        description: description,
        image: image,
        subname: subname,
      );

      storesList.add(cardModel);
    });

    return storesList;
  }
}
