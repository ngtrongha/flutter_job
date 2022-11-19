// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripModel _$$_TripModelFromJson(Map<String, dynamic> json) => _$_TripModel(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      destionation: json['destionation'] as String? ?? '[]',
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      require: json['require'] as String? ?? 'Yes',
      des: json['des'] as String? ?? '',
    );

Map<String, dynamic> _$$_TripModelToJson(_$_TripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'destionation': instance.destionation,
      'date': instance.date?.toIso8601String(),
      'require': instance.require,
      'des': instance.des,
    };
