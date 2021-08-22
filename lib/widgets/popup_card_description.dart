import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';

class PopupCardDescription extends StatelessWidget {
  final String name;
  final String adress;

  const PopupCardDescription({
    Key key,
    this.name,
    this.adress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: AutoSizeText(
          name,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: Constants.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          maxFontSize: 12,
          minFontSize: 9,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: AutoSizeText(
          adress,
          textAlign: TextAlign.start,
          style:
              GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.normal),
          maxFontSize: 9,
          minFontSize: 6,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.6,
      //       child: AutoSizeText(
      //         name,
      //         textAlign: TextAlign.start,
      //         style: GoogleFonts.poppins(
      //           color: Constants.primaryColor,
      //           fontSize: 12,
      //           fontWeight: FontWeight.w500,
      //         ),
      //         maxFontSize: 12,
      //         minFontSize: 9,
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 8,
      //     ),
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.6,
      //       child: AutoSizeText(
      //         adress,
      //         textAlign: TextAlign.start,
      //         style: GoogleFonts.poppins(
      //           fontSize: 9,
      //           fontWeight: FontWeight.normal
      //         ),
      //         maxFontSize: 9,
      //         minFontSize: 6,
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
