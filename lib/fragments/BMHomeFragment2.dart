import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../components/BMCommonCardComponent.dart';
import '../components/BMHomeFragmentHeadComponent.dart';
import '../components/BMTopServiceHomeComponent.dart';
import '../models/models.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';
import '../utils/BMConstants.dart';
import '../utils/BMDataGenerator.dart';

class BMHomeFragment2 extends StatefulWidget {
  const BMHomeFragment2({Key? key}) : super(key: key);

  @override
  State<BMHomeFragment2> createState() => _BMHomeFragmentState2();
}

class _BMHomeFragmentState2 extends State<BMHomeFragment2> {
  List<String> searchTabList = [
    'ALL BUSINESS',
    'BARBERSHOP',
    'HAIR SALON',
    'MASSAGE PARLOUR'
  ];

  int selectedTab = 0;

  List<BMCommonCardModel> recommendedList = getRecommendedList();

  Widget getComponent() {
    if (selectedTab == 0) {
      return Column(
        children: recommendedList.map((e) {
          return GestureDetector(
              onTap: () {
                // BMSingleComponentScreen(element: e).launch(context);
              },
              child: BMCommonCardComponent(
                      fullScreenComponent: true, element: e, isFavList: false)
                  .paddingSymmetric(vertical: 10));
        }).toList(),
      );
    } else if (selectedTab == 1) {
      return Column(
        children: recommendedList.map((e) {
          return BMSearchListComponent(element: e)
              .paddingSymmetric(vertical: 14);
        }).toList(),
      );
    } else if (selectedTab == 2) {
      return Column(
        children: recommendedList.map((e) {
          return BMCommonCardComponent(
                  fullScreenComponent: true, element: e, isFavList: false)
              .paddingSymmetric(vertical: 10);
        }).toList(),
      );
    } else {
      return Column(
        children: recommendedList.map((e) {
          return BMSearchListComponent(element: e)
              .paddingSymmetric(vertical: 14);
        }).toList(),
      );
    }
  }

  @override
  void initState() {
    setStatusBarColor(bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bmLightScaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeFragmentHeadComponent(),
              // titleText(title: 'My Master').paddingSymmetric(horizontal: 16),
                  // 20.height,
                  // BMMyMasterComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Categories'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // BMTopOffersScreen().launch(context);
                            },
                            child: Text('See All',
                                style:
                                    boldTextStyle(color: bmTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: bmTextColorDarkMode, size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  BMTopServiceHomeComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Our Stores (IN YO CITY)'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // BMTopOffersScreen().launch(context);
                            },
                            child: Text('See All',
                                style:
                                    boldTextStyle(color: bmTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: bmTextColorDarkMode, size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  //20.height,
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Container(
                  width: context.width(),
                  decoration: BoxDecoration(
                    color: bmSecondBackgroundColorLight,
                    borderRadius: radiusOnly(topLeft: 32, topRight: 32),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // HorizontalList(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 16, vertical: 20),
                        //   itemCount: searchTabList.length,
                        //   itemBuilder: (context, index) {
                        //     return Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: radius(32),
                        //         color: selectedTab == index
                        //             ? bmPrimaryColor
                        //             : Colors.transparent,
                        //       ),
                        //       padding: EdgeInsets.all(8),
                        //       child: Text(
                        //         searchTabList[index],
                        //         style: boldTextStyle(
                        //           size: 12,
                        //           color: selectedTab == index
                        //               ? white
                        //               : bmSpecialColorDark,
                        //         ),
                        //       ).onTap(() {
                        //         selectedTab = index;
                        //         setState(() {});
                        //       }),
                        //     );
                        //   },
                        // ),
                        // titleText(title: 'Show results', size: 16)
                        //     .paddingSymmetric(horizontal: 16),
                        getComponent().paddingSymmetric(horizontal: 16),
                        60.height,
                      ],
                    ).cornerRadiusWithClipRRectOnly(topRight: 32, topLeft: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class _BMCommonCardComponentState extends State<BMCommonCardComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fullScreenComponent ? context.width() - 32 : 250,
      decoration:
          BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bmCommonCachedNetworkImage(
                widget.element.image,
                width: widget.fullScreenComponent ? context.width() - 32 : 250,
                height: 150,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
              widget.element.saveTag
                  ? Container(
                      color: bmTextColorDarkMode.shade400,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.local_offer_rounded,
                              color: Color(0xff808080), size: 16),
                          2.width,
                          Text(
                            'Save up to 20% for next booking!',
                            style: secondaryTextStyle(color: Color(0xff636161)),
                          ).expand(),
                        ],
                      ),
                    )
                  : Offstage(),
              8.height,
              Text(widget.element.title,
                      style: boldTextStyle(size: 18, color: bmSpecialColorDark))
                  .paddingSymmetric(horizontal: 8),
              4.height,
              Text(widget.element.subtitle!,
                      style:
                          secondaryTextStyle(color: bmPrimaryColor, size: 12))
                  .paddingSymmetric(horizontal: 8),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      4.width,
                      Text(widget.element.rating!, style: boldTextStyle()),
                      2.width,
                      Text('(${widget.element.comments!})',
                          style: secondaryTextStyle(color: bmPrimaryColor)),
                    ],
                  ),
                  Text(widget.element.distance!,
                      style: secondaryTextStyle(color: bmPrimaryColor)),
                ],
              ).paddingSymmetric(horizontal: 8),
              16.height,
            ],
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.favorite,
              color: widget.element.liked! ? Colors.amber : bmTextColorDarkMode,
              size: 24,
            ).onTap(() {
              widget.element.liked = !widget.element.liked.validate();
              if (widget.isFavList) {
                favList.remove(widget.element);
              }
              setState(() {});
            }),
          )
        ],
      ),
    ).onTap(() {
      // BMSingleComponentScreen(element: widget.element).launch(context);
    });
  }
}


// class BMSeacrFragmentHeaderComponent extends StatefulWidget {
//   @override
//   State<BMSeacrFragmentHeaderComponent> createState() =>
//       _BMSeacrFragmentHeaderComponentState();
// }

// class _BMSeacrFragmentHeaderComponentState
//     extends State<BMSeacrFragmentHeaderComponent> {
//   TextEditingController searchCont = TextEditingController();

//   String searchText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         30.height,
//         Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(right: 8),
//               decoration: BoxDecoration(
//                   color: context.cardColor, borderRadius: radius(32)),
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               child: AppTextField(
//                 controller: searchCont,
//                 onChanged: (text) {
//                   searchText = text;
//                   setState(() {});
//                 },
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.search_sharp, color: bmPrimaryColor),
//                   hintText: 'Search',
//                   hintStyle: primaryTextStyle(color: bmPrimaryColor),
//                   suffixIcon: searchText.length > 0
//                       ? Icon(Icons.cancel, color: bmPrimaryColor).onTap(() {
//                           searchCont.clear();
//                         })
//                       : Offstage(),
//                 ),
//                 textFieldType: TextFieldType.NAME,
//                 cursorColor: bmPrimaryColor,
//               ),
//             ).flexible(flex: 3),
//             TextButton(
//                 onPressed: () {},
//                 child: Text('Cancel',
//                     style: boldTextStyle(color: bmTextColorDarkMode))),
//           ],
//         ),
//         16.height,
//       ],
//     );
//   }
// }
