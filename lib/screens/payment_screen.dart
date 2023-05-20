import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'screens.dart';

class PaymentScreen extends StatefulWidget {
  final String weekday;

  const PaymentScreen({Key? key, required this.weekday}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

  // void setDate() {
  //   list[0].date = "13 January,2023";
  // }
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  // void initState() {
  //   if (widget.list[0].date == "") {
  //     widget.setDate();
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Payment",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
        ),
      ),
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
                    "Rs. 450",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LastBookingScreen(
                            cancel: false,
                            weekday: widget.weekday,
                            // date: widget.list[0].date,
                            // time: widget.list[0].time,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Pay",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Space(75),
            PaymentContainer(title: "Net Banking", icon: Icons.food_bank),
            Space(16),
            PaymentContainer(title: "Cash On Delivery", icon: Icons.delivery_dining),
            Space(75),
          ],
        ),
      ),
    );
  }
}
