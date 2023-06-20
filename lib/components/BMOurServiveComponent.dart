import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/BMServiceListModel.dart';
import '../repositories/stores_repository.dart';
import '../utils/BMColors.dart';
import '../utils/BMCommonWidgets.dart';
import '../utils/BMDataGenerator.dart';
import 'BMServiceComponent.dart';

class BMOurServiveComponent extends StatefulWidget {
  String storeUid;

  BMOurServiveComponent({required this.storeUid});

  @override
  State<BMOurServiveComponent> createState() => _BMOurServiveComponentState();
}

class _BMOurServiveComponentState extends State<BMOurServiveComponent> {
  late String storeid;
  late Future<List<BMServiceListModel>> servicesList;
  late Future<List<BMServiceListModel>> accessoriesList;
  late Future<List<BMServiceListModel>> bikepartsList;
  late Future<List<BMServiceListModel>> bikesList;

  @override
  void initState() {
    super.initState();
    storeid = widget.storeUid;
    servicesList = StoresRepository.getServicesList(storeid);
    accessoriesList = StoresRepository.getAccessoriesList(storeid);
    bikepartsList = StoresRepository.getBikepartsList(storeid);
    bikesList = StoresRepository.getBikesList(storeid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.height,
        titleText(title: 'Services', size: 24),
        16.height,
        getbuilder(servicesList),
        16.height,
        titleText(title: 'Accessories', size: 24),
        16.height,
        getbuilder(accessoriesList),
        16.height,
        titleText(title: 'Bike parts', size: 24),
        16.height,
        getbuilder(bikepartsList),
        16.height,
        titleText(title: 'Bikes', size: 24),
        16.height,
        getbuilder(bikesList),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}

getbuilder(list) {
  return FutureBuilder<List<BMServiceListModel>>(
    future:
        list, // Assuming recommendedList is of type Future<List<BMCommonCardModel>>
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        // Data is available, map and display the list
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: snapshot.data!.map((e) {
            return BMServiceComponent(element: e);
          }).toList(),
        );
      } else if (snapshot.hasError) {
        // Error occurred while fetching data
        return Text('Error: ${snapshot.error}');
      } else {
        // Data is still loading
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
