
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../datamodels/models.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();

  
}

class _ShoppingCartState extends State<ShoppingCart> {

  TextEditingController textEditingController = TextEditingController();

  final AddressBloc addressBloc = AddressBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    addressBloc.close();
    textEditingController.dispose();
    super.dispose();
  }

  late List<ShopItem> cartItems;
  double totalAmount = 0;
  void calculateTotalAmount(List<ShopItem> list) {
    double res = 0;

    list.forEach((element) {
      res = res + element.price * element.quantity;
    });
    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        if (state is ShopPageLoadedState) {
          cartItems = state.cartData.shopitems;
          calculateTotalAmount(cartItems);
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }

        if (state is ItemAddingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Shopping Cart',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // bottomNavigationBar: Container(
          //   height: 68,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           offset: Offset(0, 1),
          //           blurRadius: 8,
          //           color: Color(0xFF000000).withOpacity(0.20),
          //         ),
          //         BoxShadow(
          //           offset: Offset(0, -1),
          //           blurRadius: 3,
          //           color: Color(0xFF000000).withOpacity(0.20),
          //         ),
          //         BoxShadow(
          //           offset: Offset(0, -1),
          //           blurRadius: 4,
          //           color: Color(0xFF000000).withOpacity(0.14),
          //         ),
          //       ],
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(5),
          //         topRight: Radius.circular(5),
          //       )),
          //   child: Padding(
          //     padding: const EdgeInsets.all(15.0),
          //     child: Column(
          //       children: [
          //         Text('Total Amount'),
          //         Text('\$${totalAmount.toStringAsFixed(2)}'),
          //       ],
          //     ),
          //   ),
          // ),
          bottomSheet: BottomSheet(
            elevation: 10,
            enableDrag: false,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\Rs. ${totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                weekday: 'Thursday',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Proceed to Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            onClosing: () {},
          ),
          body: cartItems == null || cartItems.length == 0
              ? Center(child: Text('Your Cart is Empty'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, bottom: 5),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          cartItems[index].imageUrl,
                                          height: 64,
                                          width: 64,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          cartItems[index].title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Spacer(),
                                        IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            setState(() {
                                              if (state
                                                  is ShopPageLoadedState) {
                                                state.cartData.shopitems
                                                    .removeAt(index);
                                                calculateTotalAmount(cartItems);
                                                BlocProvider.of<ShopBloc>(
                                                    context)
                                                  ..add(ItemDeleteCartEvent(
                                                      cartItems: state
                                                          .cartData.shopitems,
                                                      index: index));
                                              } else if (state
                                                  is ItemAddedCartState) {
                                                state.cartItems.removeAt(index);
                                                calculateTotalAmount(cartItems);

                                                BlocProvider.of<ShopBloc>(
                                                    context)
                                                  ..add(ItemDeleteCartEvent(
                                                      cartItems:
                                                          state.cartItems,
                                                      index: index));
                                              } else if (state
                                                  is ItemDeletingCartState) {
                                                state.cartItems.removeAt(index);
                                                calculateTotalAmount(cartItems);

                                                BlocProvider.of<ShopBloc>(
                                                    context)
                                                  ..add(ItemDeleteCartEvent(
                                                      cartItems:
                                                          state.cartItems,
                                                      index: index));
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //Spacer(),
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            if (cartItems[index].quantity > 0)
                                              setState(() {
                                                calculateTotalAmount(cartItems);
                                                cartItems[index].quantity--;
                                              });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 30,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 0.5)),
                                            child: Text(
                                              cartItems[index]
                                                  .quantity
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              calculateTotalAmount(cartItems);
                                              cartItems[index].quantity++;
                                            });
                                          },
                                        ),
                                        Spacer(),
                                        Text(
                                          '\Rs.${cartItems[index].price * cartItems[index].quantity} ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Space(8),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: BlocBuilder<AddressBloc, AddressState>(
                              bloc: addressBloc,
                              builder: (context, state) {
                                if(state is AddressInitial){
                                  return Row(
                                    children: [
                                      Icon(Icons.location_on, size: 20),
                                      Space(24),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 21),
                                            ),
                                            Space(4),
                                            if(textEditingController.text.isNotEmpty) 
                                              Text(
                                                "${state.inputText}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            if(textEditingController.text.isEmpty) 
                                              Text(
                                                "2911, sec 9/11, Hisar",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Space(8),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    child: Container(
                                                      height: 250,
                                                      width: 500,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            CustomTextField(
                                                                controller: textEditingController,
                                                                maxLines: 3,
                                                                title: 'Address',
                                                                hasTitle: true,
                                                                initialValue: '',
                                                                onChanged:
                                                                    (value) {
                                                                      addressBloc.add(GetInput(textEditingController.text));
                                                                    }),
                                                            CustomTextField(
                                                                maxLines: 1,
                                                                title: 'LandMark',
                                                                hasTitle: true,
                                                                initialValue: '',
                                                                onChanged:
                                                                    (value) {}),
                                                            ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                    addressBloc.add(GetInput(textEditingController.text));
                                                              },
                                                              child: Text(
                                                                'Save',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(Icons.edit)),
                                    ],
                                  );
                                
                                }
                                else{
                                  return SizedBox(height: 10,);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Space(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Icon(Icons.offline_share_outlined, size: 20),
                                Space(8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Apply Coupon",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18),
                                    ),
                                    //Space(2),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.66,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: UnderlineInputBorder()),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Space(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ExpansionTile(
                                  title: Text(
                                    "Detailed Bill",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Subtotal",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      trailing: Text(
                                          "\₹${totalAmount.toStringAsFixed(2)}",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Coupon Discount",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      trailing: Text("- ₹160",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 14)),
                                    ),
                                  ],
                                ),

                                ///Divider(indent: 10, endIndent: 12, color: Colors.grey),
                                ListTile(
                                  title: Text("Total",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18)),
                                  trailing: Text(
                                    "\₹${totalAmount.toStringAsFixed(2)}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
