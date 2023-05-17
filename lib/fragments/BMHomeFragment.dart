import 'dart:ui';
import '../models/models.dart';
import '../utils/BMColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/BMCommonWidgets.dart';
import '../utils/BMConstants.dart';
import '../utils/BMDataGenerator.dart';

class BMHomeFragment extends StatefulWidget {
  const BMHomeFragment({Key? key}) : super(key: key);

  @override
  State<BMHomeFragment> createState() => _BMHomeFragmentState();
}

class _BMHomeFragmentState extends State<BMHomeFragment> {
  List<BMCommonCardModel> specialOffersList = getSpecialOffersList();

  List<BMCommonCardModel> recommendedList = getRecommendedList();

  @override
  void initState() {
    setStatusBarColor(Colors.black);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bmLightScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeFragmentHeadComponent(),
            lowerContainer(
              screenContext: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  // titleText(title: 'My Master').paddingSymmetric(horizontal: 16),
                  // 20.height,
                  // BMMyMasterComponent(),
                  // 20.height,
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
                      titleText(title: 'Special Offers'),
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

                  // To be changed to Listview builder as horizontal list and fetch data from firebase
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: specialOffersList.length,
                    itemBuilder: (context, index) {
                      return BMCommonCardComponent(
                          element: specialOffersList[index],
                          fullScreenComponent: false,
                          isFavList: false);
                    },
                  ),
                  20.height,

                  //I think we only need one of these two for the project
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Recommended for You').expand(),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // BMRecommendedScreen().launch(context);
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
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      return BMCommonCardComponent(
                          element: recommendedList[index],
                          fullScreenComponent: false,
                          isFavList: false);
                    },
                  ),
                  40.height,
                ],
              ).cornerRadiusWithClipRRectOnly(topRight: 40),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFragmentHeadComponent extends StatelessWidget {
  const HomeFragmentHeadComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return upperContainer(
      screenContext: context,
      child: Column(
        children: [
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.wb_sunny, color: Colors.amber, size: 50),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New York',
                          style: boldTextStyle(color: Colors.white, size: 14)),
                      Wrap(
                        children: [
                          Text('32',
                              style:
                                  boldTextStyle(size: 24, color: Colors.white)),
                          Text(
                            '°C',
                            style: TextStyle(
                                fontFeatures: [FontFeature.superscripts()],
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: radius(100)),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.person_2_outlined,
                  color: bmSpecialColorDark,
                  size: 30,
                ),
              )
            ],
          ),
          16.height,
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radius(32),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: AppTextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search_sharp, color: bmPrimaryColor),
                  hintText: 'Search your services..',
                  hintStyle: boldTextStyle(color: bmPrimaryColor)),
              textFieldType: TextFieldType.NAME,
              cursorColor: bmPrimaryColor,
            ),
          ),
          16.height,
        ],
      ),
    );
  }
}

class BMCommonCardComponent extends StatefulWidget {
  BMCommonCardModel element;
  bool fullScreenComponent;
  bool isFavList;

  BMCommonCardComponent(
      {required this.element,
      required this.fullScreenComponent,
      required this.isFavList});

  @override
  State<BMCommonCardComponent> createState() => _BMCommonCardComponentState();
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

class BMTopServiceHomeComponent extends StatelessWidget {
  List<BMMasterModel> topServiceList = getTopServicesHomeList();

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        padding: EdgeInsets.symmetric(horizontal: 16),
        spacing: 16,
        itemCount: topServiceList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: context.cardColor, borderRadius: radius(32)),
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
