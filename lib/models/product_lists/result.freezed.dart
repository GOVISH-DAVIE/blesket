// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  Owner? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get isbn => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get images => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool? get isAvailable => throw _privateConstructorUsedError;
  int? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_date')
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_date')
  DateTime? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {int? id,
      Owner? owner,
      @JsonKey(name: 'product_name') String? productName,
      String? slug,
      String? description,
      String? isbn,
      int? price,
      String? images,
      int? stock,
      @JsonKey(name: 'is_available') bool? isAvailable,
      int? category,
      @JsonKey(name: 'created_date') DateTime? createdDate,
      @JsonKey(name: 'modified_date') DateTime? modifiedDate});

  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? productName = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? isbn = freezed,
    Object? price = freezed,
    Object? images = freezed,
    Object? stock = freezed,
    Object? isAvailable = freezed,
    Object? category = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Owner? owner,
      @JsonKey(name: 'product_name') String? productName,
      String? slug,
      String? description,
      String? isbn,
      int? price,
      String? images,
      int? stock,
      @JsonKey(name: 'is_available') bool? isAvailable,
      int? category,
      @JsonKey(name: 'created_date') DateTime? createdDate,
      @JsonKey(name: 'modified_date') DateTime? modifiedDate});

  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? owner = freezed,
    Object? productName = freezed,
    Object? slug = freezed,
    Object? description = freezed,
    Object? isbn = freezed,
    Object? price = freezed,
    Object? images = freezed,
    Object? stock = freezed,
    Object? isAvailable = freezed,
    Object? category = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isbn: freezed == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  _$_Result(
      {this.id,
      this.owner,
      @JsonKey(name: 'product_name') this.productName,
      this.slug,
      this.description,
      this.isbn,
      this.price,
      this.images,
      this.stock,
      @JsonKey(name: 'is_available') this.isAvailable,
      this.category,
      @JsonKey(name: 'created_date') this.createdDate,
      @JsonKey(name: 'modified_date') this.modifiedDate});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  final Owner? owner;
  @override
  @JsonKey(name: 'product_name')
  final String? productName;
  @override
  final String? slug;
  @override
  final String? description;
  @override
  final String? isbn;
  @override
  final int? price;
  @override
  final String? images;
  @override
  final int? stock;
  @override
  @JsonKey(name: 'is_available')
  final bool? isAvailable;
  @override
  final int? category;
  @override
  @JsonKey(name: 'created_date')
  final DateTime? createdDate;
  @override
  @JsonKey(name: 'modified_date')
  final DateTime? modifiedDate;

  @override
  String toString() {
    return 'Result(id: $id, owner: $owner, productName: $productName, slug: $slug, description: $description, isbn: $isbn, price: $price, images: $images, stock: $stock, isAvailable: $isAvailable, category: $category, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      owner,
      productName,
      slug,
      description,
      isbn,
      price,
      images,
      stock,
      isAvailable,
      category,
      createdDate,
      modifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  factory _Result(
          {final int? id,
          final Owner? owner,
          @JsonKey(name: 'product_name') final String? productName,
          final String? slug,
          final String? description,
          final String? isbn,
          final int? price,
          final String? images,
          final int? stock,
          @JsonKey(name: 'is_available') final bool? isAvailable,
          final int? category,
          @JsonKey(name: 'created_date') final DateTime? createdDate,
          @JsonKey(name: 'modified_date') final DateTime? modifiedDate}) =
      _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  Owner? get owner;
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @override
  String? get slug;
  @override
  String? get description;
  @override
  String? get isbn;
  @override
  int? get price;
  @override
  String? get images;
  @override
  int? get stock;
  @override
  @JsonKey(name: 'is_available')
  bool? get isAvailable;
  @override
  int? get category;
  @override
  @JsonKey(name: 'created_date')
  DateTime? get createdDate;
  @override
  @JsonKey(name: 'modified_date')
  DateTime? get modifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}
