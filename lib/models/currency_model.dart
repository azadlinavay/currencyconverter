import 'dart:convert';

import 'package:flutter/foundation.dart';

class CurrencyModel {
  final String base_code;
  final Map<String, dynamic> conversion_rates;
  CurrencyModel({
    required this.base_code,
    required this.conversion_rates,
  });

  CurrencyModel copyWith({
    String? base_code,
    Map<String, dynamic>? conversion_rates,
  }) {
    return CurrencyModel(
      base_code: base_code ?? this.base_code,
      conversion_rates: conversion_rates ?? this.conversion_rates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_code': base_code,
      'conversion_rates': conversion_rates,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      base_code: map['base_code'] ?? '',
      conversion_rates: Map<String, dynamic>.from(map['conversion_rates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CurrencyModel(base_code: $base_code, conversion_rates: $conversion_rates)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyModel &&
        other.base_code == base_code &&
        mapEquals(other.conversion_rates, conversion_rates);
  }

  @override
  int get hashCode => base_code.hashCode ^ conversion_rates.hashCode;
}
