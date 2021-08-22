import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';
import '../widgets/map.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          centerTitle: false,
          elevation: 0,
          title: Text(
            'Tesisler',
            style: TextStyleConstants.appBarTitle,
          ),
        ),
        body: Map(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('search'),
          backgroundColor: Constants.primaryColor.withOpacity(0.95),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
