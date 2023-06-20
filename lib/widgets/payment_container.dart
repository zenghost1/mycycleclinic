import 'package:flutter/material.dart';
import '../widgets/space.dart';

List<UpiPayment> upiPaymentData = upiPaymentList();

class UpiPayment {
  String? paymentUrl;
  String? PaymentName;

  UpiPayment({this.paymentUrl, this.PaymentName});
}

List<UpiPayment> upiPaymentList() {
  List<UpiPayment> dataList = [];

  dataList.add(UpiPayment(paymentUrl: null, PaymentName: "Online"));

  return dataList;
}

class PaymentContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isUpi;

  PaymentContainer(
      {Key? key, required this.title, required this.icon, this.isUpi = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 2,
        ),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 22),
              Space(16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Visibility(
            visible: isUpi,
            child: Space(16),
          ),
          Visibility(
            visible: isUpi,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              children: List.generate(
                upiPaymentData.length,
                (index) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25 - 32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              upiPaymentData[index].paymentUrl.toString(),
                              height: 35,
                              width: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Space(8),
                      Text(
                        upiPaymentData[index].PaymentName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
