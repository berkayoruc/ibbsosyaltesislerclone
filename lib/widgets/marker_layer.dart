import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

import 'popup_card.dart';
import 'tesis_marker.dart';

class MarkerLayerWid extends StatelessWidget {
  final dynamic data;
  final PopupController popupcontroller;
  final MapController mapcontroller;

  const MarkerLayerWid(
      {Key key, this.data, this.popupcontroller, this.mapcontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMarkerLayerWidget(
      options: PopupMarkerLayerOptions(
          markers: data
              .map<TesisMarker>((x) => TesisMarker(x.name, x.address,
                  width: 50,
                  height: 50,
                  anchorPos: AnchorPos.align(AnchorAlign.top),
                  builder: (ctx) => Image.asset('assets/pin.png'),
                  // Icon(
                  //       Icons.place,
                  //       color: Constants.primaryColor,
                  //       size: 30,
                  //     ),
                  point: LatLng(x.lat, x.lon)))
              .toList(),
          popupSnap: PopupSnap.mapBottom,
          popupController: popupcontroller,
          popupBuilder: (BuildContext context, Marker marker) {
            mapcontroller.move(marker.point, 15);
            return PopupCard(
                tesisMarker: marker, popupcontroller: popupcontroller);
          }),
    );
  }
}
