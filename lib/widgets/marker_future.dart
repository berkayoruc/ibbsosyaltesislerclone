import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';
import 'package:ibbsosyaltesisleri/widgets/popup_card.dart';
import 'package:ibbsosyaltesisleri/widgets/tesis_marker.dart';
import 'package:latlong2/latlong.dart';
import '../core/services/tesis.dart';

class MarkerFuture extends StatelessWidget {
  final PopupController popupcontroller;
  final MapController mapcontroller;

  const MarkerFuture({
    Key key,
    @required this.popupcontroller,
    @required this.mapcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTesisler(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                color: Colors.white10,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Constants.primaryColor)),
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Text('Yükleniyor...',
                              style: GoogleFonts.poppins()))
                    ],
                  ),
                ),
              );
              break;
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Lütfen internet bağlantınızı kontrol edip tekrar deneyin',
                      style: GoogleFonts.poppins()),
                ));
                // return Text('error: ${snapshot.error}');
              } else {
                print(snapshot.data.length);
                return PopupMarkerLayerWidget(
                  options: PopupMarkerLayerOptions(
                      markers: snapshot.data
                          .map<TesisMarker>((x) => TesisMarker(
                              x.name, x.address,
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
                            tesisMarker: marker,
                            popupcontroller: popupcontroller);
                      }),
                );
              }
          }
        });
  }
}
