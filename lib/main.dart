import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';

import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import './screens/place_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => GreatPlaces()),
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: const Color(0xFFE3F2FD),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlacescreen.routeName: (context) => const AddPlacescreen(),
          PlaceDetailsScreen.routeName: (context) => const PlaceDetailsScreen(),
        },
      ),
    );
  }
}
