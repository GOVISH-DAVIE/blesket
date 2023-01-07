// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyCart _$$_MyCartFromJson(Map<String, dynamic> json) => _$_MyCart(
      user: json['user'] as int?,
      variations: json['variations'] as List<dynamic>?,
      product: json['product'] as int?,
      cart: json['cart'],
      quantity: json['quantity'] as int?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$_MyCartToJson(_$_MyCart instance) => <String, dynamic>{
      'user': instance.user,
      'variations': instance.variations,
      'product': instance.product,
      'cart': instance.cart,
      'quantity': instance.quantity,
      'is_active': instance.isActive,
    };
