class Tesis {
  Tesis(this._phone, this._address, this._name, this._lat, this._lon,
      this._countyid, this._distance);
  // TELEFON	:	444 10 34
  // ADRES	:	Bebek Arnavutköy Cad. No:72 ARNAVUTKÖY/BEŞİKTAŞ
  // ADI	:	İBB Arnavutköy Sosyal Tesisleri
  // LON	:	29.04473166495070
  // LAT	:	41.06750149652860
  // ILCEADI	:
  // ILCEID	:	1183
  // MESAFE	:	0

  String _phone;
  String _address;
  String _name;
  double _lat;
  double _lon;
  int _countyid;
  int _distance;

  factory Tesis.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return Tesis(
        json['TELEFON'],
        json['ADRES'],
        json['ADI'],
        double.parse(json['LAT'].toString()),
        double.parse(json['LON'].toString()),
        int.parse(json['ILCEID'].toString()),
        int.parse(json['MESAFE'].toString()),
      );
    }
  }

  String get phone => _phone;
  String get address => _address;
  String get name => _name;
  double get lat => _lat;
  double get lon => _lon;
  int get countyid => _countyid;
  int get distance => _distance;
}
