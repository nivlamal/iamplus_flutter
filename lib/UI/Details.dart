import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iamplus_flutter/blocs/bloc_provider.dart';
import 'package:iamplus_flutter/blocs/restaurantBloc.dart';
import 'package:iamplus_flutter/data/restaurant.dart';


class Details extends StatelessWidget {
  Details({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = RestaurantBloc();
    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: StreamBuilder<Restaurant>(
        stream: bloc.selectedRestaurantStream,
        builder: (context, snapshot) {
          final restaurant = snapshot.data??null;
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
            padding: EdgeInsets.only(
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(44.0),
              topRight: Radius.circular(44.0),
              bottomRight: Radius.circular(11.0),
              bottomLeft: Radius.circular(44.0),
            ),
            color: const Color(0xfffcf9f7),
            boxShadow: [
              BoxShadow(
                color: const Color(0x1a000000),
                offset: Offset(8, -16),
                blurRadius: 32,
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset((width - 245) / 2, 80),
          child:_buildImage(245, restaurant?.thumb ?? "")
        ),
        Transform.translate(
          offset: Offset(32.0, 418),
          child:
              // Adobe XD layer: 'Fresh hamburger with' (text)
              SizedBox(
            width: 215.0,
            height: 20.0,
            child: Text(
              restaurant?.cuisines ?? '',
              style: TextStyle(
                fontFamily: 'Montserrat-Regular',
                fontSize: 12,
                color: const Color(0xff656565),
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(32.0, 451),
          child: // Adobe XD layer: 'Address' (text)
            SizedBox(
              height: 20.0,
              child: Text(
                'Address:',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: const Color(0xff656565),
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
        ),
        Transform.translate(
          offset: Offset(32.0, 471),
          child: // Adobe XD layer: 'Address' (text)
            SizedBox(
              height: 20.0,
              child: Text(
                restaurant?.location?.address ?? '',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: const Color(0xff656565),
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
            ),
        ),
        Transform.translate(
          offset: Offset(32.0, 504.0),
          child:
              // Adobe XD layer: 'ratings' (text)
              SizedBox(
            width: 75.0,
            height: 20.0,
            child: Text(
              'Ratings:',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: const Color(0xff656565),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(32.0, 524.0),
          child:
              // Adobe XD layer: 'stars' (text)
              SizedBox(
            width: 150.0,
            height: 20.0,
            child: Text(
              restaurant?.userRating?.votes.toString() + ' Ratings - ' +
              restaurant?.userRating?.aggregateRating.toString() + ' stars',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: const Color(0xff656565),
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(32.0, 373),
          child:
              // Adobe XD layer: 'Chicken Hamburger' (text)
              Text(
            restaurant?.name ?? '',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 24,
              color: const Color(0xff373737),
            ),
            textAlign: TextAlign.left,
          ),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32.0),
                    bottomLeft: Radius.circular(32.0),
                  ),
                  color: const Color(0xff99adff),
                ),
              ),
              Transform.translate(
                offset: Offset(24.0, 12.0),
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

const String _svg_khr0j7 =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(7.87, 4.0)" d="M 9.778535842895508 8.493793487548828 C 9.918789863586426 8.375452041625977 9.999500274658203 8.204324722290039 9.999995231628418 8.024245262145996 C 10.00049018859863 7.844165325164795 9.920721054077148 7.672625541687012 9.781119346618652 7.553563594818115 L 1.072293400764465 0.1555073708295822 C 0.8816385865211487 -0.006591226439923048 0.6105725169181824 -0.045630794018507 0.3794079720973969 0.05571639910340309 C 0.1482434570789337 0.1570635885000229 -0.0001858084578998387 0.3800183832645416 6.267201229093189e-07 0.6256221532821655 L 6.267201229093189e-07 15.37422275543213 C -0.0002484316355548799 15.619553565979 0.1477976590394974 15.8423490524292 0.3785530030727386 15.94390869140625 C 0.6093083024024963 16.04546737670898 0.8801144361495972 16.00701522827148 1.071001529693604 15.84558868408203 L 9.778535842895508 8.493793487548828 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_qqrib0 =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(3.0, 4.5)" d="M 13.5 0 C 11.89000034332275 0 10.00800037384033 1.825000047683716 9 3 C 7.992000102996826 1.825000047683716 6.110000133514404 0 4.5 0 C 1.651000022888184 0 0 2.221999883651733 0 5.050000190734863 C 0 8.182999610900879 3 11.5 9 15 C 15 11.5 18 8.25 18 5.25 C 18 2.421999931335449 16.34900093078613 0 13.5 0 Z" fill="#365eff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
