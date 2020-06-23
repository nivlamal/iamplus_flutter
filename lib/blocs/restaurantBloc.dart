import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as geoLoc;

import 'package:iamplus_flutter/blocs/bloc.dart';
import 'package:iamplus_flutter/data/repo.dart';
import 'package:iamplus_flutter/data/restaurant.dart';

class RestaurantBloc implements Bloc {
  
  final List<Restaurant> _restaurants = Repo().restaurants;
  final String userKey = Repo().userKey;
  final geoLoc.Location _location = new geoLoc.Location();

  final _restaurantListController = StreamController<List<Restaurant>>();
  Stream<List<Restaurant>> get restaurantListStream => _restaurantListController.stream;

  final _selectedRestaurantController = StreamController<Restaurant>();
  Stream<Restaurant> get selectedRestaurantStream => _selectedRestaurantController.stream;

  //Constructor
  RestaurantBloc() {
    Timer(Duration(milliseconds: 100), getRestaurants);
    Timer(Duration(milliseconds: 100), (){_selectedRestaurantController.sink.add(Repo().selectedRestaurant);});
  }

  void getRestaurants() async {
    final _locationData = await _getLocation();
    final lat = _locationData.latitude;
    final lon = _locationData.longitude;
    
    //zomato url with lat lon params
    // var url = "https://developers.zomato.com/api/v2.1/geocode?"
    //   + "lat=" + lat.toString()
    //   + "&lon=" + lon.toString();
    //   print(url);
    // //send http get request to zomato
    // final response = await http.get(url, headers: {"user-key": userKey});
    // if(response.statusCode == 200) {
    //   _restaurants.clear();
    //   final jsonBody = jsonDecode(response.body);
    //   jsonBody["nearby_restaurants"].forEach((val) => 
    //     _restaurants.add(Restaurant.fromJson(val["restaurant"]))
    //   );
    // }
    _restaurantListController.sink.add(_restaurants);
  }

  void selectRestaurant(Restaurant restaurant) async {
    Repo().selectedRestaurant = restaurant;
    _selectedRestaurantController.sink.add(Repo().selectedRestaurant);
  }

  Future<geoLoc.LocationData> _getLocation() async {
    bool _serviceEnabled;
    geoLoc.PermissionStatus _permissionGranted;
    geoLoc.LocationData _locationData;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == geoLoc.PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != geoLoc.PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await _location.getLocation();
    return _locationData;
  }

  @override
  void dispose() {
    _restaurantListController.close();
    _selectedRestaurantController.close();
  }
}