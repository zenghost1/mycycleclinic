import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BMServiceListModel.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';

class BMServiceComponent extends StatelessWidget {
  BMServiceListModel element;

  BMServiceComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(45)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(title: element.name, size: 14, maxLines: 2),
              12.height,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RS.${element.cost}',
                    style: secondaryTextStyle(
                      color: bmPrimaryColor,
                      size: 12,
                    ),
                  ),
                  16.width,
                  // Text(
                  //   element.time,
                  //   style: secondaryTextStyle(
                  //     color:bmPrimaryColor,
                  //     size: 12,
                  //   ),
                  // ),
                ],
              )
            ],
          ).expand(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bmPrimaryColor.withAlpha(50),
                  borderRadius: radius(100),
                  border: Border.all(color: bmPrimaryColor),
                ),
                padding: EdgeInsets.all(6),
                child: Icon(Icons.info, color: bmPrimaryColor),
              ),
              8.width,
              AppButton(
                width: 60,
                padding: EdgeInsets.all(0),
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Text('Book',
                    style: boldTextStyle(color: Colors.white, size: 12)),
                color: bmPrimaryColor,
                onTap: () {
                  // showBookBottomSheet(context, element);
                },
              ),
            ],
          )
        ],
      ).paddingSymmetric(vertical: 8),
    );
  }
}
