// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SocketMessage _$$_SocketMessageFromJson(Map<String, dynamic> json) =>
    _$_SocketMessage(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$_SocketMessageToJson(_$_SocketMessage instance) =>
    <String, dynamic>{
      'data': instance.data,
      'action': instance.action,
    };
