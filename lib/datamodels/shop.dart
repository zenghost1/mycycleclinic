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

  ShopItem(
      {required this.imageUrl, required this.price, required this.quantity, required this.title});
}
