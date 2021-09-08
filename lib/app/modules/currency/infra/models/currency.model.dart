import 'dart:convert';

import '../../domain/entitties/currency.entity.dart';

class CurrencyModel extends Currency {
  String code;
  String codein;
  String high;
  String low;

  CurrencyModel({
    required this.code,
    required this.codein,
    required this.high,
    required this.low,
  }) : super(code, codein, high, low);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'codein': codein,
      'high': high,
      'low': low,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      code: map['code'],
      codein: map['codein'],
      high: map['high'],
      low: map['low'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) => CurrencyModel.fromMap(json.decode(source));
}
