import 'package:iamplus_flutter/data/restaurant.dart';

class Repo {
  // A static version of the repo that will be shared by everyone
  static final Repo _repo = new Repo._internal();    

  final List<Restaurant> restaurants = [];
  final String userKey = "1e3c349cc25d35cea4a89cf86995cd6b";
  Restaurant selectedRestaurant;

  Repo._internal();

  factory Repo() {
    return _repo;
  }

}