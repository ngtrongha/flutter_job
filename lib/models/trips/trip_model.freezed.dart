// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TripModel _$TripModelFromJson(Map<String, dynamic> json) {
  return _TripModel.fromJson(json);
}

/// @nodoc
mixin _$TripModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get destionation => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String get require => throw _privateConstructorUsedError;
  String get des => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripModelCopyWith<TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) then) =
      _$TripModelCopyWithImpl<$Res, TripModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String destionation,
      DateTime? date,
      String require,
      String des});
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res, $Val extends TripModel>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? destionation = null,
    Object? date = freezed,
    Object? require = null,
    Object? des = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destionation: null == destionation
          ? _value.destionation
          : destionation // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      require: null == require
          ? _value.require
          : require // ignore: cast_nullable_to_non_nullable
              as String,
      des: null == des
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripModelCopyWith<$Res> implements $TripModelCopyWith<$Res> {
  factory _$$_TripModelCopyWith(
          _$_TripModel value, $Res Function(_$_TripModel) then) =
      __$$_TripModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String destionation,
      DateTime? date,
      String require,
      String des});
}

/// @nodoc
class __$$_TripModelCopyWithImpl<$Res>
    extends _$TripModelCopyWithImpl<$Res, _$_TripModel>
    implements _$$_TripModelCopyWith<$Res> {
  __$$_TripModelCopyWithImpl(
      _$_TripModel _value, $Res Function(_$_TripModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? destionation = null,
    Object? date = freezed,
    Object? require = null,
    Object? des = null,
  }) {
    return _then(_$_TripModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      destionation: null == destionation
          ? _value.destionation
          : destionation // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      require: null == require
          ? _value.require
          : require // ignore: cast_nullable_to_non_nullable
              as String,
      des: null == des
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripModel implements _TripModel {
  const _$_TripModel(
      {this.id = 0,
      this.name = '',
      this.destionation = '[]',
      this.date,
      this.require = 'Yes',
      this.des = ''});

  factory _$_TripModel.fromJson(Map<String, dynamic> json) =>
      _$$_TripModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String destionation;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final String require;
  @override
  @JsonKey()
  final String des;

  @override
  String toString() {
    return 'TripModel(id: $id, name: $name, destionation: $destionation, date: $date, require: $require, des: $des)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.destionation, destionation) ||
                other.destionation == destionation) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.require, require) || other.require == require) &&
            (identical(other.des, des) || other.des == des));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, destionation, date, require, des);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripModelCopyWith<_$_TripModel> get copyWith =>
      __$$_TripModelCopyWithImpl<_$_TripModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripModelToJson(
      this,
    );
  }
}

abstract class _TripModel implements TripModel {
  const factory _TripModel(
      {final int id,
      final String name,
      final String destionation,
      final DateTime? date,
      final String require,
      final String des}) = _$_TripModel;

  factory _TripModel.fromJson(Map<String, dynamic> json) =
      _$_TripModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get destionation;
  @override
  DateTime? get date;
  @override
  String get require;
  @override
  String get des;
  @override
  @JsonKey(ignore: true)
  _$$_TripModelCopyWith<_$_TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}
