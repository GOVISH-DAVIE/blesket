import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'product_lists.freezed.dart';
part 'product_lists.g.dart';

@freezed
class ProductLists with _$ProductLists {
  factory ProductLists({
    int? count,
    String? next,
    dynamic previous,
    List<Result>? results,
  }) = _ProductLists;

  factory ProductLists.fromJson(Map<String, dynamic> json) =>
      _$ProductListsFromJson(json);
}
