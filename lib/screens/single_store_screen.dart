import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/BMOurServiveComponent.dart';
import '../models/BMCommonCardModel.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';

class BMSingleComponentScreen extends StatefulWidget {
  BMCommonCardModel element;

  BMSingleComponentScreen({required this.element});

  @override
  _BMSingleComponentScreenState createState() =>
      _BMSingleComponentScreenState();
}

class _BMSingleComponentScreenState extends State<BMSingleComponentScreen> {
  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bmLightScaffoldBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: bmLightScaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: bmPrimaryColor),
                onPressed: () {
                  finish(context);
                },
              ).visible(innerBoxIsScrolled),
              title: titleText(title: widget.element.title)
                  .visible(innerBoxIsScrolled),
              actions: [
                IconButton(
                  icon: Icon(Icons.subdirectory_arrow_right,
                      color: bmPrimaryColor),
                  onPressed: () {
                    // BMSingleImageScreen(element: widget.element).launch(context);
                  },
                ).visible(innerBoxIsScrolled),
                // IconButton(
                //   icon: widget.element.liked!
                //       ? Icon(Icons.favorite, color: bmPrimaryColor)
                //       : Icon(Icons.favorite_outline, color: bmPrimaryColor),
                //   onPressed: () {
                //     widget.element.liked = !widget.element.liked!;
                //     setState(() {});
                //   },
                // ).visible(innerBoxIsScrolled),
              ],
              leadingWidth: 30,
              pinned: true,
              elevation: 0.5,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 66, left: 30, right: 50),
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: [
                    Stack(
                      children: [
                        bmCommonCachedNetworkImage(
                          widget.element.image,
                          height: 300,
                          width: context.width(),
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child:
                                  Icon(Icons.arrow_back, color: bmPrimaryColor),
                              decoration: BoxDecoration(
                                borderRadius: radius(100),
                                color: context.cardColor,
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 16, top: 30),
                            ).onTap(() {
                              finish(context);
                            }, borderRadius: radius(100)),
                            Row(
                              children: [
                                Container(
                                  child:
                                      Icon(Icons.close, color: bmPrimaryColor),
                                  decoration: BoxDecoration(
                                    borderRadius: radius(100),
                                    color: context.cardColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(right: 16, top: 30),
                                ).onTap(() {
                                  finish(context);
                                }, borderRadius: radius(100)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      color: bmLightScaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(title: widget.element.title, size: 26),
                          12.height,
                          Text(
                            widget.element.subtitle!,
                            style: secondaryTextStyle(
                                color: bmPrimaryColor, size: 12),
                          ),
                          // 8.height,
                          Row(
                            children: const [
                              // Text(widget.element.rating!,
                              //     style: boldTextStyle()),
                              // 2.width,
                              // RatingBar(
                              //   initialRating: widget.element.rating.toDouble(),
                              //   minRating: 5,
                              //   direction: Axis.horizontal,
                              //   allowHalfRating: true,
                              //   itemCount: 5,
                              //   itemSize: 18,
                              //   itemPadding: EdgeInsets.symmetric(horizontal: 0),
                              //   itemBuilder: (context, _) => Icon(
                              //     Icons.star,
                              //     color: Colors.amber,
                              //   ),
                              //   onRatingUpdate: (rating) {
                              //     //
                              //   },
                              // ),
                              // 6.width,
                              // Text(widget.element.comments!,
                              //     style: secondaryTextStyle(
                              //         color: bmTextColorDarkMode)),
                            ],
                          ),
                          // 8.height,
                          Wrap(
                            spacing: 0,
                            children: const [
                              //   Container(
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: bmPrimaryColor),
                              //       color: bmLightScaffoldBackgroundColor,
                              //       borderRadius: radius(32),
                              //     ),
                              //     padding: EdgeInsets.all(8),
                              //     child: Row(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Icon(Icons.call_outlined,
                              //             color: bmPrimaryColor),
                              //         4.width,
                              //         Text('Call us',
                              //             style: boldTextStyle(
                              //                 color: bmPrimaryColor)),
                              //       ],
                              //     ),
                              //   ).onTap(() {
                              //     // BMCallScreen().launch(context);
                              //   }, borderRadius: radius(32)),
                              //   Container(
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: bmPrimaryColor),
                              //       color: bmLightScaffoldBackgroundColor,
                              //       borderRadius: radius(32),
                              //     ),
                              //     padding: EdgeInsets.all(8),
                              //     child: Row(
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: [
                              //         Image.asset('images/beauty_master/chat.png',
                              //             height: 20, color: bmPrimaryColor),
                              //         8.width,
                              //         Text('Send Message',
                              //             style: boldTextStyle(
                              //                 color: bmPrimaryColor)),
                              //       ],
                              //     ),
                              //   ).onTap(() {}),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: bmSecondBackgroundColorLight,
            borderRadius: radiusOnly(topLeft: 32, topRight: 32),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                BMOurServiveComponent(storeUid:widget.element.storeUid),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
