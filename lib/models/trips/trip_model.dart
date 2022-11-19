// To parse this JSON data, do
//
//     final TripModel = TripModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

const String tableNotes = 'trips';

class TripFields {
  static final List<String> values = [
    /// Add all fields
    id, name, destionation, date, require, des,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String destionation = 'destionation';
  static const String date = 'date';
  static const String require = 'require';
  static const String des = 'des';
}

@freezed
class TripModel with _$TripModel {
  const factory TripModel({
    @Default(0) final int id,
    @Default('') final String name,
    @Default('[]') final String destionation,
    final DateTime? date,
    @Default('Yes') final String require,
    @Default('') final String des,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
