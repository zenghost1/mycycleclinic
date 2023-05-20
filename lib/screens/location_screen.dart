// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../blocs/blocs.dart';

// import '../widgets/blackbutton.dart';
// import '../widgets/searchbox_extend.dart';

// //TODO: to place the extracted widgets in another folder, I will do it myself -Z

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({super.key});

// //The following is for the app router file routing config
// // We first declare a string of routename for LocationScreen class
//   static const String routeName = '/location';
// // A route method which returns a abstract class Route
//   static Route route() {
//     return MaterialPageRoute(
//         builder: (_) => const LocationScreen(),
//         settings: const RouteSettings(name: routeName));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //NOTE: Appbar size is fixed, So i am keeping only the name text and button
//       //in the app bar title, Other (searchbox) will be handled in the body
//       //element's stack
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).backgroundColor,
//         title: Text(
//           ' Hi, Shashi!',
//           style: Theme.of(context).textTheme.headline1,
//         ),
//         actions: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: const BorderRadius.all(Radius.circular(20))),
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             child: IconButton(
//                 // TODO: I would like the splash to be disabled
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/profile');
//                 },
//                 icon: const Icon(
//                   Icons.person,
//                   color: Colors.black,
//                 )),
//           ),

//           //THIS IS A DEPRECATED IMPLEMENTATION WHICH MIGHT OR MIGHT NOT LOOK BETTER

//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           //   child: ElevatedButton(
//           //     onPressed: () {},
//           //     child: const Icon(
//           //       Icons.person,
//           //       color: Colors.black,
//           //     ),
//           //     style: ButtonStyle(
//           //         backgroundColor: MaterialStateProperty.all<Color>(
//           //             Theme.of(context).primaryColor),
//           //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           //             RoundedRectangleBorder(
//           //                 borderRadius: BorderRadius.all(Radius.circular(60)),
//           //                 side: BorderSide(
//           //                     color: Theme.of(context).primaryColor)))),
//           //   ),
//           // ),
//         ],
//       ),

//       body: BlocBuilder<LocationBloc, LocationState>(
//         builder: (context, state) {
//           if (state is LocationLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is LocationLoaded) {
//             return Stack(children: [
//               // ignore: sized_box_for_whitespace
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: double.infinity,
//                 child: GoogleMap(
//                   myLocationButtonEnabled: true,
//                   myLocationEnabled: true,
//                   buildingsEnabled: false,
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(state.place.lat, state.place.lon),
//                     zoom: 18,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: const [
//                   SearchBoxExtender(),
//                   _SearchBoxSuggestions(),
//                 ],
//               ),
//               const Positioned(
//                   bottom: 20, left: 20, right: 20, child: BlackButton())
//             ]);
//           } else {
//             return const Center(
//               child: Text('Something went wrong!'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class _SearchBoxSuggestions extends StatelessWidget {
//   const _SearchBoxSuggestions({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AutocompleteBloc, AutocompleteState>(
//       builder: (context, state) {
//         if (state is AutocompleteLoading) {
//           return const SizedBox();
//         }
//         if (state is AutocompleteLoaded) {
//           return ListView.builder(
//             padding: EdgeInsets.zero,
//             shrinkWrap: true,
//             itemCount: state.autocomplete.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 color: Colors.black.withOpacity(0.6),
//                 child: ListTile(
//                   title: Text(
//                     state.autocomplete[index].description,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline6!
//                         .copyWith(color: Colors.white),
//                   ),
//                   onTap: () {
//                     context.read<LocationBloc>().add(
//                           SearchLocation(
//                             placeId: state.autocomplete[index].placeId,
//                           ),
//                         );
//                     context.read<AutocompleteBloc>().add(ClearAutocomplete());
//                   },
//                 ),
//               );
//             },
//           );
//         } else {
//           return Text('Something went wrong!');
//         }
//       },
//     );
//   }
// }
