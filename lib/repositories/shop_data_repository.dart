import '../datamodels/models.dart';

class ShopDataProvider {
  Future<ShopData> getShopItems() async {
    List<ShopItem> shopItems = [
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU",
        price: 22,
        quantity: 1,
        title: 'Shoes',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Sharee',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 30.12,
        quantity: 1,
        title: 'Bat',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU",
        price: 40.12,
        quantity: 1,
        title: 'Jwellery',
      ),
    ];
    return ShopData(shopitems: shopItems);
  }

  Future<ShopData> geCartItems() async {
    List<ShopItem> shopItems = [
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT4ABYBZPcdRIPbWLPZ6ytYe_h1BWOnnPZ1Q&usqp=CAU",
        price: 22,
        quantity: 1,
        title: 'Shoes',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-g2GSISpufBWs1ZLWkd_T3KvXCU_TTerPw&usqp=CAU",
        price: 50,
        quantity: 1,
        title: 'Headpone',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFhnA96BAkDXRTx8hfJZVXT18hMBCJ8zVmQw&usqp=CAU",
        price: 80.12,
        quantity: 1,
        title: 'Sharee',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDEjZY6mmImADpDqFtmxrksJttjRCSax9Iwg&usqp=CAU",
        price: 30.12,
        quantity: 1,
        title: 'Bat',
      ),
      ShopItem(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLziqzVEjoRBTCp49fyPx_BiXwfFmv-Rpw0w&usqp=CAU",
        price: 40.12,
        quantity: 1,
        title: 'Jwellery',
      ),
    ];
    return ShopData(shopitems: shopItems);
  }
}