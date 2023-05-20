import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../datamodels/models.dart';
import 'screens.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key?key}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool loadingData = true;
  List<ShopItem> _cartItems = [];
  late List<ShopItem> shopItems;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, ShopState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          loadingData = true;
        } else if (state is ShopPageLoadedState) {
          shopItems = state.shopData.shopitems;
          _cartItems = state.cartData.shopitems;
          loadingData = false;
        }
        if (state is ItemAddedCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
      },
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          print("produc page state: $state");

          return Scaffold(
            appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Color(0xFFEEEEEE),
            body: loadingData
                ? Center(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Text(
                                'clinic.name',
                                style: TextStyle(color: Colors.white, fontSize: 32)
                              ),
                            ),
                            // SizedBox(height: 5),
                            // Text(
                            //   '{clinic.distance}km away - \${clinic.deliveryFee} delivery fee',
                            //   style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12)
                            // ),
                            // SizedBox(height: 5),
                            // Text(
                            //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            //   style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12)
                            // ),
                          ],
                        ),
                      ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom:
                                  Radius.elliptical(MediaQuery.of(context).size.width, 50),
                            ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/shape1.png'),
                                // image: NetworkImage(
                                //   clinic.imageUrl,
                                // ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Expanded(child: Text('Services~', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),)),
                        ),
                        Stack(
                          clipBehavior: Clip.hardEdge,
                          children: [
                            Container(
                              // height: displayHeight(context) * 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                      itemCount: shopItems.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return ProductItem(
                                          addToCart: () {
                                            setState(() {
                                              _cartItems.add(shopItems[index]);
                                            });

                                            print("added");
                                          },
                                          // productImage:
                                          //     shopItems[index].imageUrl,
                                          productImage:
                                              shopItems[index].imageUrl,
                                          price: shopItems[index].price,
                                          title: shopItems[index].title,
                                          press: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BlocProvider.value(
                                                            value: BlocProvider
                                                                .of<ShopBloc>(
                                                                    context)
                                                              ..add(ItemAddingCartEvent(
                                                                  cartItems:
                                                                      _cartItems)),
                                                            child:
                                                                ProductDetail(
                                                              shopItem:
                                                                  shopItems[
                                                                      index],
                                                            ))));
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
