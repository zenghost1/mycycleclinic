import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  static const routeName = "/checkoutScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text('Checkout', style: TextStyle(fontSize: 27, color: Colors.black, fontWeight: FontWeight.w700),)),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF1FFB6),
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deliver to', style: TextStyle(fontSize: 13, color: Color(0xFFB3B3B3), fontWeight: FontWeight.w500),),
                    Row(
                      children: [
                        _getAdress(),
                        Expanded(child: SizedBox(width: 1,), flex: 1,),
                        Icon(Icons.edit_document),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text('Payment', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              Text('Payment Method', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),),
              SizedBox(height: 20,),
              _getPaymentMethod(),
              Expanded(child: SizedBox(height: 1,)),
              _getPayment(),
              SizedBox(height: 15,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(top: 10, bottom: 10,)),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFCCFE00)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),
                        )
                    )
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Complete Payment",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
                )
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _getAdress() => Expanded(child: Text("Address jahan deliver krna hai", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),), flex: 9,);

  Container _getPaymentMethod() {
    return Container(
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "radio value", 
                          groupValue: "group value", 
                          onChanged: (value){
                            print(value); //selected value
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color(0xFFCCFE00);
                            }
                            return Color(0xFFCCFE00);
                          })
                        ),
                        Icon(Icons.money_off, color: Color(0xFFCCFE00),),
                        SizedBox(width: 10,),
                        Text('Cash on Delivery', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
                        Expanded(child: SizedBox(width: 1,)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "radio value", 
                          groupValue: "group value", 
                          onChanged: (value){
                            print(value); //selected value
                          },
                          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color(0xFFCCFE00);
                            }
                            return Color(0xFFCCFE00);
                          })
                        ),
                        Icon(Icons.home_filled, color: Colors.pinkAccent,),
                        SizedBox(width: 10,),
                        Text('Net Banking', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),),
                        Expanded(child: SizedBox(width: 1,)),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }

  Row _getPayment() {
    return Row(
              children: [
                Text('Total', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),),
                Expanded(child: SizedBox(width: 1,)),
                Text('Rs.5000', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),),
              ],
            );
  }
}