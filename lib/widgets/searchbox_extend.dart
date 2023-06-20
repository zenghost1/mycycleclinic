
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../blocs/blocs.dart';

// class SearchBoxExtender extends StatelessWidget {
//   const SearchBoxExtender({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return BlocBuilder<AutocompleteBloc, AutocompleteState>(
//       builder: (context, state) {
//         return Stack(
//           children: [

//             Container(
//               height: size.height * 0.13,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).backgroundColor,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   )),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 22),
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               height: 54,
//               decoration: const BoxDecoration(
//                   color: Color(0xFF1B1B1B),
//                   borderRadius: BorderRadius.all(Radius.circular(60))),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.search,
//                     color: Color(0xFF797979),
//                   ),
//                   const SizedBox(
//                     width: 7,
//                   ),
//                   Expanded(
//                     child: TextField(
//                       style: Theme.of(context).textTheme.headline4,
//                       onChanged: (value) {
//                         context
//                             .read<AutocompleteBloc>()
//                             .add(LoadAutocomplete(searchInput: value));
//                       },
//                       decoration: InputDecoration(
//                           filled: true,
//                           hintText: 'Search Destination',
//                           hintStyle: Theme.of(context).textTheme.headline4),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
