import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';
import '../pages/tesis.dart';
import 'active_icon.dart';
import 'tesis_marker.dart';

class PopupCard extends StatelessWidget {
  final TesisMarker tesisMarker;
  final PopupController popupcontroller;
  const PopupCard({Key key, this.tesisMarker, this.popupcontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.90;
    var height = MediaQuery.of(context).size.height * 0.15;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      constraints: BoxConstraints(maxWidth: width, maxHeight: height),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // tileColor: Colors.white,
        leading: ActiveIcon(
          iconData: Icons.restaurant,
          backgroundColor: Constants.primaryColor,
          size: 40,
        ),
        title: AutoSizeText(
          tesisMarker.name,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: Constants.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          maxFontSize: 14,
          minFontSize: 10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: AutoSizeText(
          tesisMarker.address,
          textAlign: TextAlign.start,
          style:
              GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.normal),
          maxFontSize: 10,
          minFontSize: 8,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => TesisDetail(
            name: tesisMarker.name,
            address: tesisMarker.address,
          ),
        )),
      ),
      // Card(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       InkWell(
      //         onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //           content: Text(MediaQuery.of(context).size.toString()),
      //           duration: Duration(milliseconds: 1000),
      //         )),
      //         // Navigator.of(context).push(MaterialPageRoute(
      //         //   builder: (BuildContext context) => TesisDetail(),
      //         // )),
      //         child: Container(
      //           width: height * 0.75,
      //           height: height,
      //           decoration: BoxDecoration(
      //               color: Constants.primaryColor,
      //               shape: BoxShape.rectangle,
      //               borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(15),
      //                   bottomLeft: Radius.circular(15))),
      //           child: Icon(
      //             Icons.restaurant,
      //             color: Colors.white,
      //             size: 30,
      //           ),
      //         ),
      //       ),
      // PopupCardDescription(
      //     name: tesisMarker.name, adress: tesisMarker.address)
      // Column(
      //   children: [
      //     IconButton(
      //         icon: Icon(Icons.cancel),
      //         onPressed: () => popupcontroller.hidePopup()),
      //     Expanded(
      //       child: Text(
      //         tesisMarker.name,
      //         style: TextStyle(fontSize: 12),
      //         overflow: TextOverflow.ellipsis,
      //         maxLines: 2,
      //       ),
      //     ),
      //   ],
      // )
      // ],
    );
    // ),
    // );
  }
}
