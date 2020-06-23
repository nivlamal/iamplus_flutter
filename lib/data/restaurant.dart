class Restaurant {
  String id;
  String name;
  String url;
  double averageCostForTwo;
  int priceRange;
  String currency;
  String thumb;
  String cuisines;

  Location location;
  UserRating userRating;

  Restaurant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url =  json['url'],
        averageCostForTwo = json['average_cost_for_two'].toDouble(),
        priceRange = json['price_range'],
        currency = json['currency'],
        thumb = json['thumb'],
        cuisines = json['cuisines'],
        location = Location.fromJson(json['location']),
        userRating = UserRating.fromJson(json['user_rating']);

}

class Location {
  String address;
  String locality;
  String city;
  double latitude;
  double longitude;
  String zipcode;
  int countryId;

  Location.fromJson(Map<String, dynamic> json)
    : address = json['address'],
      locality = json['locality'],
      city = json['city'],
      latitude = double.parse(json['latitude']),
      longitude = double.parse(json['longitude']),
      zipcode = json['zipcode'],
      countryId = json['country_id'];
}

class UserRating {
  String aggregateRating;
  String ratingText;
  String ratingColor;
  int votes;

  UserRating.fromJson(Map<String, dynamic> json)
    : aggregateRating = json['aggregate_rating'],
      ratingText = json['rating_text'],
      ratingColor = json['rating_color'],
      votes = int.parse(json['votes']);
}
