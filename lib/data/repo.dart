import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iamplus_flutter/data/restaurant.dart';

class Repo {
  factory Repo() {
    return _repo;
  }

  // A static version of the repo that will be shared by everyone
  Repo._internal();
  static final Repo _repo = Repo._internal();    

  final List<Restaurant> restaurants = [];
  String userKey = '';
  String apiUrl = '';
  Restaurant selectedRestaurant;

  Future<void> init() async {
    // load config data from assets
    final String configString = await rootBundle.loadString(
      'assets/config.json',
    );
    
    final Map<String, dynamic> configJson = jsonDecode(configString) as Map<String, dynamic>;

    userKey = configJson['userKey'] as String;
    apiUrl =  configJson['apiUrl'] as String;
  }
  

}