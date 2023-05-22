import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/models.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';

class BMSearchListComponent extends StatelessWidget {
  BMCommonCardModel element;

  BMSearchListComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: bmPrimaryColor.withAlpha(70), borderRadius: radius(100)),
          padding: EdgeInsets.all(8),
          child: Image.asset('images/beauty_master/magnifier.png',
              height: 24, color: bmPrimaryColor),
        ),
        16.width,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: element.title, size: 16),
            4.height,
            Text(
              element.subtitle!,
              style: secondaryTextStyle(color: bmPrimaryColor, size: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}