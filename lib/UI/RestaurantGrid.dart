import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iamplus_flutter/UI/RestaurantCard.dart';
import 'package:iamplus_flutter/data/restaurant.dart';

class RestaurantGrid extends StatelessWidget {
  final List<Restaurant> _restaurants;
  final Function(Restaurant) _onPressed;
  RestaurantGrid(this._restaurants, this._onPressed);

  @override
  Widget build(BuildContext context) {
    const topMargin = 142;
    const bottomMargin = 26;
    const leftMargin = 30;
    const rowHeight = 198 + 25;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var height = constraints.maxHeight - topMargin - bottomMargin;
        return SizedBox(
          height: height,
          width: constraints.maxWidth - leftMargin,
          child: _buildGrid((height/rowHeight).floor())
        );
      }
    );
  }

  Widget _buildGrid(int noOfRows) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: (_restaurants.length / noOfRows).ceil(),
      itemBuilder: (context, index) {
        return Column(
          children: _restaurants.sublist(
            noOfRows * index, 
            min(noOfRows * index + noOfRows, _restaurants.length)).map((restaurant) => 
            GestureDetector(
              onTap: () {
                _onPressed(restaurant);
              },
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 25,
                  right: 25
                ),
                child: RestaurantCard(restaurant),
              )
            )
          ).toList(),
        );
      },
    );
  }
}
