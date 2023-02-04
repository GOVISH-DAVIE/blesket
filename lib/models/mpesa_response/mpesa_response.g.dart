// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpesa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MpesaResponse _$$_MpesaResponseFromJson(Map<String, dynamic> json) =>
    _$_MpesaResponse(
      mpesaCode: json['mpesa_code'] as String?,
      amount: json['amount'] as String?,
      firstName: json['first_name'] as String?,
      secondName: json['second_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      currentDate: json['current_date'] as String?,
      currentTime: json['current_time'] as String?,
      accountNumber: json['account_number'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_MpesaResponseToJson(_$_MpesaResponse instance) =>
    <String, dynamic>{
      'mpesa_code': instance.mpesaCode,
      'amount': instance.amount,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'phone_number': instance.phoneNumber,
      'current_date': instance.currentDate,
      'current_time': instance.currentTime,
      'account_number': instance.accountNumber,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
