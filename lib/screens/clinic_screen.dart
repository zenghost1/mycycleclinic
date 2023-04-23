import 'package:flutter/material.dart';

import '../datamodels/clinic_model.dart';

class ClinicDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant-details';

  static Route route({required Clinic clinic}) {
    return MaterialPageRoute(
      builder: (_) => ClinicDetailsScreen(clinic: clinic),
      settings: RouteSettings(name: routeName),
    );
  }

  final Clinic clinic;

  const ClinicDetailsScreen({required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(),
                primary: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/basket');
              },
              child: Text('Basket'),
            ),
          ],
        )),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/tiktok.png'),
                    // image: NetworkImage(
                    //   clinic.imageUrl,
                    // ),
                    fit: BoxFit.cover),
              ),
            ),
            ClinicInformation(clinic: clinic),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: clinic.categories.length,
              itemBuilder: (context, index) {
                return _buildProducts(clinic, context, index);
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildProducts(
    Clinic clinic,
    BuildContext context,
    int index,
  ) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            clinic.categories[index].name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.black
                ),
          ),
        ),
        Column(
          children: clinic.products
              .where((product) =>
                  product.category == clinic.categories[index].name)
              .map(
                (product) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class ClinicInformation extends StatelessWidget {
  final Clinic clinic;

  const ClinicInformation({
    Key? key,
    required this.clinic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            clinic.name,
            style: TextStyle(color: Color(0xFFCCFE00), fontSize: 32)
          ),
          SizedBox(height: 5),
          Text(
            '${clinic.distance}km away - \$${clinic.deliveryFee} delivery fee',
            style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12)
          ),
          SizedBox(height: 5),
          Text(
            'Clinic Information',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 5),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12)
          ),
        ],
      ),
    );
  }
}