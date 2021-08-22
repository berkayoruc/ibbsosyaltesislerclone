import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';
import '../pages/tesis.dart';
import 'active_icon.dart';
import '../core/models/tesis.dart';

class TesisSearch extends SearchDelegate<Tesis> {
  final List<Tesis> tesisList;

  TesisSearch(this.tesisList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  String get searchFieldLabel => 'Tesis Arayın';

  @override
  Widget buildSuggestions(BuildContext context) {
    if (tesisList.isEmpty) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text('Veri bulunamadı'),
        ),
      );
    } else {
      final results = tesisList.where((element) =>
          element.name.toLowerCase().contains(query.toLowerCase()));
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: ListView(
            children: results
                .map<ListTile>((tesis) => ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        tesis.name,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      leading: ActiveIcon(
                        backgroundColor: Constants.primaryColor,
                        iconData: Icons.restaurant,
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => TesisDetail(
                          name: tesis.name,
                          address: tesis.address,
                        ),
                      )),
                    ))
                .toList()),
      );
    }
  }
}
