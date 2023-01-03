import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'product_list.freezed.dart';
part 'product_list.g.dart';

@freezed
class ProductList with _$ProductList {
  factory ProductList({
    int? id,
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
    @JsonKey(name: 'modified_date') DateTime? modifiedDate,
  }) = _ProductList;

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
}
