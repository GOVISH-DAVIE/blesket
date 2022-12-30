// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_lists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductLists _$ProductListsFromJson(Map<String, dynamic> json) {
  return _ProductLists.fromJson(json);
}

/// @nodoc
mixin _$ProductLists {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  dynamic get previous => throw _privateConstructorUsedError;
  List<Result>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductListsCopyWith<ProductLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListsCopyWith<$Res> {
  factory $ProductListsCopyWith(
          ProductLists value, $Res Function(ProductLists) then) =
      _$ProductListsCopyWithImpl<$Res, ProductLists>;
  @useResult
  $Res call(
      {int? count, String? next, dynamic previous, List<Result>? results});
}

/// @nodoc
class _$ProductListsCopyWithImpl<$Res, $Val extends ProductLists>
    implements $ProductListsCopyWith<$Res> {
  _$ProductListsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductListsCopyWith<$Res>
    implements $ProductListsCopyWith<$Res> {
  factory _$$_ProductListsCopyWith(
          _$_ProductLists value, $Res Function(_$_ProductLists) then) =
      __$$_ProductListsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count, String? next, dynamic previous, List<Result>? results});
}

/// @nodoc
class __$$_ProductListsCopyWithImpl<$Res>
    extends _$ProductListsCopyWithImpl<$Res, _$_ProductLists>
    implements _$$_ProductListsCopyWith<$Res> {
  __$$_ProductListsCopyWithImpl(
      _$_ProductLists _value, $Res Function(_$_ProductLists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_ProductLists(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductLists implements _ProductLists {
  _$_ProductLists(
      {this.count, this.next, this.previous, final List<Result>? results})
      : _results = results;

  factory _$_ProductLists.fromJson(Map<String, dynamic> json) =>
      _$$_ProductListsFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final dynamic previous;
  final List<Result>? _results;
  @override
  List<Result>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductLists(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductLists &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      count,
      next,
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductListsCopyWith<_$_ProductLists> get copyWith =>
      __$$_ProductListsCopyWithImpl<_$_ProductLists>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductListsToJson(
      this,
    );
  }
}

abstract class _ProductLists implements ProductLists {
  factory _ProductLists(
      {final int? count,
      final String? next,
      final dynamic previous,
      final List<Result>? results}) = _$_ProductLists;

  factory _ProductLists.fromJson(Map<String, dynamic> json) =
      _$_ProductLists.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  dynamic get previous;
  @override
  List<Result>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_ProductListsCopyWith<_$_ProductLists> get copyWith =>
      throw _privateConstructorUsedError;
}
