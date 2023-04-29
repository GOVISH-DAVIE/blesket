// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  int? get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'product_name') String? productName,
      String? weight,
      @JsonKey(name: 'status_code') int? statusCode});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? weight = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'product_name') String? productName,
      String? weight,
      @JsonKey(name: 'status_code') int? statusCode});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? weight = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$_Data(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  _$_Data(
      {this.id,
      @JsonKey(name: 'product_name') this.productName,
      this.weight,
      @JsonKey(name: 'status_code') this.statusCode});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  final String? weight;
  @override
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @override
  String toString() {
    return 'Data(id: $id, productName: $productName, weight: $weight, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, productName, weight, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {final int? id,
      @JsonKey(name: 'product_name') final String? productName,
      final String? weight,
      @JsonKey(name: 'status_code') final int? statusCode}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  String? get weight;
  @override
  @JsonKey(name: 'status_code')
  int? get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
