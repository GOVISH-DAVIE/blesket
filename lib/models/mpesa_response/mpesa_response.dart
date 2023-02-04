import 'package:freezed_annotation/freezed_annotation.dart';

part 'mpesa_response.freezed.dart';
part 'mpesa_response.g.dart';

@freezed
class MpesaResponse with _$MpesaResponse {
  factory MpesaResponse({
    @JsonKey(name: 'mpesa_code') String? mpesaCode,
    String? amount,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'second_name') String? secondName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'current_date') String? currentDate,
    @JsonKey(name: 'current_time') String? currentTime,
    @JsonKey(name: 'account_number') String? accountNumber,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _MpesaResponse;

  factory MpesaResponse.fromJson(Map<String, dynamic> json) =>
      _$MpesaResponseFromJson(json);
}
