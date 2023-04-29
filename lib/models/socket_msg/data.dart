import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    int? id,
    @JsonKey(name: 'product_name') String? productName,
    String? weight,
    @JsonKey(name: 'status_code') int? statusCode,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
