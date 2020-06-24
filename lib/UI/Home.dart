import 'package:flutter/material.dart';
import 'package:iamplus_flutter/UI/Details.dart';
import 'package:iamplus_flutter/UI/RestaurantGrid.dart';
import 'package:iamplus_flutter/blocs/bloc_provider.dart';
import 'package:iamplus_flutter/blocs/restaurantBloc.dart';
import 'package:iamplus_flutter/data/restaurant.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final RestaurantBloc bloc = RestaurantBloc();
    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: StreamBuilder<List<Restaurant>>(
        stream: bloc.restaurantListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Restaurant>> snapshot) {
          final List<Restaurant> restaurants = snapshot.data ?? [];
          final Function(Restaurant) selectRestaurant = (Restaurant restaurant) {
            bloc.selectRestaurant(restaurant);
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => Details()),
            );
          };
          return _buildUI(restaurants, selectRestaurant);
        },
      ),
    );
  }

  Widget _buildUI(
      List<Restaurant> restuarants, Function(Restaurant) selectRestaurant) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: const Offset(0.5, 0.0),
            child: Container(
              width: 379.0,
              height: 812.0,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(30.0, 68.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0.0, 32.0),
                  child: Stack(
                    children: <Widget>[
                      Transform.translate(
                        offset: const Offset(0.0, -0.67),
                        child: const Text(
                          'Near you',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Color(0xff373737),
                            height: 1.25,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // Restaurant Grid
                      Transform.translate(
                        offset: const Offset(0.0, 42.0),
                        child: RestaurantGrid(restuarants, selectRestaurant),
                      )
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0.0, -5.0),
                  child: const Text(
                    'Restaurants',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      color: Color(0xff000000),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
