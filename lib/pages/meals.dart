import 'package:flutter/material.dart';
import 'package:ibbsosyaltesisleri/core/constants.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Spesiyaller',
          style: TextStyleConstants.appBarTitle,
        ),
      ),
      body: Container(
        child: Text('Meals'),
      ),
    );
  }
}
