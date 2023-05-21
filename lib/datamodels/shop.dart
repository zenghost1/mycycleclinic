import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mycycleclinic/datamodels/clinic_model.dart';

class ShopData {
  List<ShopItem> shopitems;

  ShopData({required this.shopitems});

  void addProduct(ShopItem p) {
    shopitems.add(p);
  }

  void removeProduct(ShopItem p) {
    shopitems.add(p);
  }

  

}

class ShopItem {
  String imageUrl;
  String title;
  double price;
  int quantity;
  String? description;

  factory ShopItem.fromSnapshot(DocumentSnapshot snap) {
    return ShopItem(
      imageUrl: snap['imageurl'],
      price: snap['price'],
      quantity: snap['quantity'],
      title: snap['title'],
      description: snap['Description']
    );
  }

  ShopItem(
      {required this.imageUrl, required this.price, required this.quantity, required this.title, this.description});
}
