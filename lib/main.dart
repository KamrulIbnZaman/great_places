import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import './providers/great_places.dart';

//screens
import './screens/places_list_screen.dart';
import './screens/add_places_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GreatPlaces>(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.green[300],
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
