import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class TileLayerWid extends StatelessWidget {
  const TileLayerWid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TileLayerWidget(
      options: TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          maxZoom: 18),
    );
  }
}
