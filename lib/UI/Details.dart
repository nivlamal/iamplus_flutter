import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iamplus_flutter/blocs/bloc_provider.dart';
import 'package:iamplus_flutter/blocs/restaurantBloc.dart';
import 'package:iamplus_flutter/data/restaurant.dart';


class Details extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final RestaurantBloc bloc = RestaurantBloc();
    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: StreamBuilder<Restaurant>(
        stream: bloc.selectedRestaurantStream,
        builder: (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
          final Restaurant restaurant = snapshot.data;
          return _buildUI(restaurant);
        },
      ),
    );
  }

  Widget _buildUI(Restaurant restaurant) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding: const EdgeInsets.only(
              top:60
            ),
            child: Stack(
              children: <Widget>[
                _buildDetails(
                  constraints.maxWidth,
                  constraints.maxHeight - 60,
                  restaurant
                ),
              ],
            ),
          )
        );
      }
    );
  }

  Widget _buildDetails(double width, double height, Restaurant restaurant) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Rectangle' (shape)
        Container(
          height: height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44.0),
              topRight: Radius.circular(44.0),
              bottomRight: Radius.circular(11.0),
              bottomLeft: Radius.circular(44.0),
            ),
            color: Color(0xfffcf9f7),
            boxShadow: [
              BoxShadow(
                color: Color(0x1a000000),
                offset: Offset(8, -16),
                blurRadius: 32,
              ),
            ],
          ),
        ),
        // Restaurant thumb
        Transform.translate(
          offset: Offset((width - 245) / 2, 80),
          child:_buildImage(245, restaurant?.thumb ?? '')
        ),
        // Details text
        Transform.translate(
          offset: const Offset(32.0, 373),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Restaurant name
              Container(
                width: width - 64,
                child: AutoSizeText(
                  restaurant?.name ?? '',
                  maxLines:1,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 42,
                    color: Color(0xff373737),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Restaurant cuisine
              Container(
                height: height * 0.033,
                child: AutoSizeText(
                  restaurant?.cuisines ?? '',
                  style: const TextStyle(
                    fontFamily: 'Montserrat-Regular',
                    fontSize: 24,
                    color: Color(0xff656565),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Restaurant address heading
              Container(
                height: height * 0.033,
                margin: const EdgeInsets.only(
                  top: 13.0,
                ),
                child: const AutoSizeText(
                  'Address:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Restaurant address body
              Container(
                height: height * 0.033,
                child: AutoSizeText(
                  restaurant?.location?.address ?? '',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    color: Color(0xff656565),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Restaurant ratings heading
              Container(
                height: height * 0.033,
                margin: const EdgeInsets.only(
                  top: 13.0,
                ),
                child: const AutoSizeText(
                  'Ratings:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    color: Color(0xff656565),
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Restaurant ratings body
              Container(
                height: height * 0.033,
                child: AutoSizeText(
                  restaurant?.userRating?.votes.toString() + ' Ratings - ' +
                  restaurant?.userRating?.aggregateRating.toString() + ' stars',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    color: Color(0xff656565),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ),
        Transform.translate(
          offset: Offset(width - 88, 16.0),
          child:
              // Adobe XD layer: 'Btn heart' (group)
              Stack(
            children: <Widget>[
              // Adobe XD layer: 'Rectangle' (shape)
              Container(
                width: 72.0,
                height: 48.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    bottomLeft: Radius.circular(32.0),
                  ),
                  color: Color(0xff99adff),
                ),
              ),
              Transform.translate(
                offset: const Offset(24.0, 12.0),
                child:
                    // Adobe XD layer: 'Heart' (group)
                    Stack(
                  children: <Widget>[
                    // Adobe XD layer: 'Shape' (shape)
                    SvgPicture.string(
                      '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(3.0, 4.5)" d="M 13.5 0 C 11.89000034332275 0 10.00800037384033 1.825000047683716 9 3 C 7.992000102996826 1.825000047683716 6.110000133514404 0 4.5 0 C 1.651000022888184 0 0 2.221999883651733 0 5.050000190734863 C 0 8.182999610900879 3 11.5 9 15 C 15 11.5 18 8.25 18 5.25 C 18 2.421999931335449 16.34900093078613 0 13.5 0 Z" fill="#365eff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage(double height, String thumb) {
    return Stack(
        children: <Widget>[
          // Adobe XD layer: 'Mask' (shape)
          Container(
            width: height,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(height / 2, height / 2)),
              color: const Color(0xffd8d8d8),
            ),
          ),
          // Adobe XD layer: 'Image' (group)
          Stack(
            children: <Widget>[
              // Adobe XD layer: 'Mask' (shape)
              Container(
                width: height,
                height: height,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.elliptical(height/2, height/2)),
                  color: const Color(0xffd8d8d8),
                ),
              ),
              // Adobe XD layer: 'twenty20_3998e4bc-f…' (shape)
              Container(
                width: height,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(height/2, height/2)),
                    image: DecorationImage(
                      image: NetworkImage(thumb),
                      fit: BoxFit.fitHeight,
                    ),
                ),
              ),
            ],
          ),
        ],
      );
  }
}