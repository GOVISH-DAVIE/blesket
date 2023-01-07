// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartList _$$_CartListFromJson(Map<String, dynamic> json) => _$_CartList(
      statusCode: json['status_code'] as int?,
      myCart: (json['my_cart'] as List<dynamic>?)
          ?.map((e) => MyCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfItems: json['number_of_items'] as int?,
    );

Map<String, dynamic> _$$_CartListToJson(_$_CartList instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'my_cart': instance.myCart,
      'number_of_items': instance.numberOfItems,
    };
