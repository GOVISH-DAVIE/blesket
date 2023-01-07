// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyCart _$MyCartFromJson(Map<String, dynamic> json) {
  return _MyCart.fromJson(json);
}

/// @nodoc
mixin _$MyCart {
  int? get user => throw _privateConstructorUsedError;
  List<dynamic>? get variations => throw _privateConstructorUsedError;
  int? get product => throw _privateConstructorUsedError;
  dynamic get cart => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyCartCopyWith<MyCart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCartCopyWith<$Res> {
  factory $MyCartCopyWith(MyCart value, $Res Function(MyCart) then) =
      _$MyCartCopyWithImpl<$Res, MyCart>;
  @useResult
  $Res call(
      {int? user,
      List<dynamic>? variations,
      int? product,
      dynamic cart,
      int? quantity,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class _$MyCartCopyWithImpl<$Res, $Val extends MyCart>
    implements $MyCartCopyWith<$Res> {
  _$MyCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? variations = freezed,
    Object? product = freezed,
    Object? cart = freezed,
    Object? quantity = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      variations: freezed == variations
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyCartCopyWith<$Res> implements $MyCartCopyWith<$Res> {
  factory _$$_MyCartCopyWith(_$_MyCart value, $Res Function(_$_MyCart) then) =
      __$$_MyCartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? user,
      List<dynamic>? variations,
      int? product,
      dynamic cart,
      int? quantity,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class __$$_MyCartCopyWithImpl<$Res>
    extends _$MyCartCopyWithImpl<$Res, _$_MyCart>
    implements _$$_MyCartCopyWith<$Res> {
  __$$_MyCartCopyWithImpl(_$_MyCart _value, $Res Function(_$_MyCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? variations = freezed,
    Object? product = freezed,
    Object? cart = freezed,
    Object? quantity = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_MyCart(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      variations: freezed == variations
          ? _value._variations
          : variations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as dynamic,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyCart implements _MyCart {
  _$_MyCart(
      {this.user,
      final List<dynamic>? variations,
      this.product,
      this.cart,
      this.quantity,
      @JsonKey(name: 'is_active') this.isActive})
      : _variations = variations;

  factory _$_MyCart.fromJson(Map<String, dynamic> json) =>
      _$$_MyCartFromJson(json);

  @override
  final int? user;
  final List<dynamic>? _variations;
  @override
  List<dynamic>? get variations {
    final value = _variations;
    if (value == null) return null;
    if (_variations is EqualUnmodifiableListView) return _variations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? product;
  @override
  final dynamic cart;
  @override
  final int? quantity;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  String toString() {
    return 'MyCart(user: $user, variations: $variations, product: $product, cart: $cart, quantity: $quantity, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCart &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._variations, _variations) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other.cart, cart) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_variations),
      product,
      const DeepCollectionEquality().hash(cart),
      quantity,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyCartCopyWith<_$_MyCart> get copyWith =>
      __$$_MyCartCopyWithImpl<_$_MyCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyCartToJson(
      this,
    );
  }
}

abstract class _MyCart implements MyCart {
  factory _MyCart(
      {final int? user,
      final List<dynamic>? variations,
      final int? product,
      final dynamic cart,
      final int? quantity,
      @JsonKey(name: 'is_active') final bool? isActive}) = _$_MyCart;

  factory _MyCart.fromJson(Map<String, dynamic> json) = _$_MyCart.fromJson;

  @override
  int? get user;
  @override
  List<dynamic>? get variations;
  @override
  int? get product;
  @override
  dynamic get cart;
  @override
  int? get quantity;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_MyCartCopyWith<_$_MyCart> get copyWith =>
      throw _privateConstructorUsedError;
}
