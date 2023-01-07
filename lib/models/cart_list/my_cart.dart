import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cart.freezed.dart';
part 'my_cart.g.dart';

@freezed
class MyCart with _$MyCart {
  factory MyCart({
    int? user,
    List<dynamic>? variations,
    int? product,
    dynamic cart,
    int? quantity,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _MyCart;

  factory MyCart.fromJson(Map<String, dynamic> json) => _$MyCartFromJson(json);
}
