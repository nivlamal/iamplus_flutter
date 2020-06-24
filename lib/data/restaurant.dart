class Restaurant {
  Restaurant.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        url =  json['url'] as String,
        averageCostForTwo = json['average_cost_for_two'] as int,
        priceRange = json['price_range'] as int,
        currency = json['currency'] as String,
        thumb = json['thumb'] as String,
        cuisines = json['cuisines'] as String,
        location = Location.fromJson(json['location'] as Map<String, dynamic>),
        userRating = UserRating.fromJson(json['user_rating'] as Map<String, dynamic>);
  
  String id;
  String name;
  String url;
  int averageCostForTwo;
  int priceRange;
  String currency;
  String thumb;
  String cuisines;

  Location location;
  UserRating userRating;
}

class Location {
  Location.fromJson(Map<String, dynamic> json)
    : address = json['address'] as String,
      locality = json['locality'] as String,
      city = json['city'] as String,
      latitude = double.parse(json['latitude'] as String),
      longitude = double.parse(json['longitude'] as String),
      zipcode = json['zipcode'] as String,
      countryId = json['country_id'] as int;
  
  String address;
  String locality;
  String city;
  double latitude;
  double longitude;
  String zipcode;
  int countryId;
}

class UserRating {
  UserRating.fromJson(Map<String, dynamic> json)
    : aggregateRating = json['aggregate_rating'] as String,
      ratingText = json['rating_text'] as String,
      ratingColor = json['rating_color'] as String,
      votes = int.parse(json['votes'] as String);

  String aggregateRating;
  String ratingText;
  String ratingColor;
  int votes;
}
