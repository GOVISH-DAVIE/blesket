import 'package:freezed_annotation/freezed_annotation.dart';

import 'my_cart.dart';

part 'cart_list.freezed.dart';
part 'cart_list.g.dart';

@freezed
class CartList with _$CartList {
  factory CartList({
    @JsonKey(name: 'status_code') int? statusCode,
    @JsonKey(name: 'my_cart') List<MyCart>? myCart,
    @JsonKey(name: 'number_of_items') int? numberOfItems,
  }) = _CartList;

  factory CartList.fromJson(Map<String, dynamic> json) =>
      _$CartListFromJson(json);
}
