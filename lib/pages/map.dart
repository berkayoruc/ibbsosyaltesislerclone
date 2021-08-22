import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';
import '../widgets/map.dart';

class MapPage extends StatefulWidget {
  final dynamic data;
  MapPage({Key key, this.data}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.primaryColor,
            centerTitle: false,
            elevation: 0,
            title: Text(
              'Tesisler',
              style: TextStyleConstants.appBarTitle,
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () => print('click'))
            ],
          ),
          body: Map(data: widget.data),
        ),
      ),
    );
  }
}
