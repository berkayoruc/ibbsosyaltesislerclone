import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TesisMarker extends Marker {
  final String name;
  final String address;

  TesisMarker(
    this.name,
    this.address, {
    LatLng point,
    WidgetBuilder builder,
    double width = 30,
    double height = 30,
    AnchorPos anchorPos,
  }) : super(
            point: point,
            builder: builder,
            width: width,
            height: height,
            anchorPos: anchorPos);
}
