import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

import 'marker_future.dart';
import 'tile_layer.dart';

class Map extends StatelessWidget {
  const Map({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PopupController _popupLayerController = PopupController();
    final MapController _mapController = MapController();
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
          center: LatLng(41, 29),
          zoom: 10,
          maxZoom: 18,
          minZoom: 8,
          interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          nePanBoundary: LatLng(41.67168087, 29.99349976),
          swPanBoundary: LatLng(40.74684080, 27.84375000),
          onTap: (_) => _popupLayerController.hidePopup()),
      children: [
        TileLayerWid(),
        MarkerFuture(
          popupcontroller: _popupLayerController,
          mapcontroller: _mapController,
        )
      ],
    );
  }
}
