import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  factory Result({
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
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
