import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    print('........................');
    Place newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      image: image,
    );
    
    print('.........................');
    print(newPlace.id);
    print(newPlace.title);
    print(newPlace.image.path);
    
    _places.add(newPlace);
    notifyListeners();
    print('.........................');
    DbHelper.insert(
      'places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
  }


Future<void> fetchandSetDb()async{
  print('........ aiane jamela');
 final dataList=await DbHelper.fetchDb('places');

final placesList= dataList.map((place){
   Place(id: place['id'], title: place['title'], image: File(place['image'],),);
 }).toList();

if(placesList==null){
  return;
}
_places=placesList.cast();
}
}
