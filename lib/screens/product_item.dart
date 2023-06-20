import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productImage,
   required this.title,
   required this.price,
    required this.press,
    required this.addToCart,
  }) : super(key: key);
  final String productImage, title;
  final double price;
  final VoidCallback press;
  final VoidCallback addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, ),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 30),
                      blurRadius: 60,
                      color: Color(0xFF393939).withOpacity(.1)),
                ],
                //borderRadius: BorderRadius.circular(14)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: press,
                      child: Container(
                        child: Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              productImage,
                              height: 80,
                              width: 80,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                alignment: Alignment.topLeft,
                                child: Expanded(child: Text(title,style: TextStyle(color: Colors.black, fontSize: 35
                              ),)
                              )),
                              Container(
                                height: 30,
                                alignment: Alignment.topLeft,
                                child: Expanded(child: Text('\$ ${price}',style: TextStyle(color: Colors.black, fontSize: 19
                              ),)
                              )),
                            ],
                          ),
                          Container(child: Expanded(child: SizedBox(width: 1,)),),
                          IconButton(onPressed: addToCart, icon: Icon(Icons.add)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              // ),
            ),
            // Positioned(
            //   top: 30,
            //   right: 5,
            //   child: Image.network(
            //     productImage,
            //     height: 80,
            //   ),
            // ),
            // Positioned(
            //   bottom: 70,
            //   right: 20,
            //   child: TextButton(
            //       //color: Color(0xFF845EC2),
            //       onPressed: addToCart,
            //       child: Text(
            //         'Add to Cart',
            //         style: TextStyle(color: Colors.white),
            //       )),
            // ),
            // Positioned(
            //   top: 30,
            //   right: 5,
            //   child: Image.network(
            //     productImage,
            //     height: 80,
            //   ),
            // ),
            // Positioned(
            //   top: 110,
            //   right: 50,
            //   child: Text(
            //     title,
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Positioned(
            //   top: 130,
            //   right: 50,
            //   child: Text(
            //     '\$ ${price}',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
