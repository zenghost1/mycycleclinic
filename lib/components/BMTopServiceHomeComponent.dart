import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/BMMasterModel.dart';
import '../utils/BMCommonWidgets.dart';
import '../utils/BMDataGenerator.dart';

class BMCategoriesHomeComponent extends StatelessWidget {
  final List<BMMasterModel> topServiceList = getTopServicesHomeList();

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        spacing: 16,
        itemCount: topServiceList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: radius(32)),
                child: bmCommonCachedNetworkImage(topServiceList[index].image,
                    height: 36),
              ).onTap(() {
                // BMTopOffersScreen().launch(context);
              }),
              8.height,
              Text(topServiceList[index].name, style: boldTextStyle(size: 14)),
            ],
          );
        });
  }
}
