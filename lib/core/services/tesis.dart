import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ibbsosyaltesisleri/core/models/tesis.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

Future<List> getTesisler({String lat = '', String lon = ''}) async {
  var url = '${Constants.source}lon=$lon&lat=$lat';
  final response = await http.get(Uri.parse(url));
  return compute(parseTesisler, [response.body, response.statusCode]);
}

List<Tesis> parseTesisler(List arguments) {
  final body = arguments.first;
  final code = arguments.last;
  var values = <Tesis>[];
  if (code == 200) {
    final tesisler = jsonDecode(body)['ArrayOfAramaList']['AramaList'];
    tesisler.forEach((tesis) => values.add(Tesis(
          tesis['TELEFON'],
          tesis['ADRES'],
          tesis['ADI'],
          double.parse(tesis['LAT'].toString()),
          double.parse(tesis['LON'].toString()),
          int.parse(tesis['ILCEID'].toString()),
          int.parse(tesis['MESAFE'].toString()),
        )));
  }
  return values;
}
