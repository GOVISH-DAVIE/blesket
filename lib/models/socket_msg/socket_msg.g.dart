// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_msg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SocketMsg _$$_SocketMsgFromJson(Map<String, dynamic> json) => _$_SocketMsg(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$_SocketMsgToJson(_$_SocketMsg instance) =>
    <String, dynamic>{
      'data': instance.data,
      'action': instance.action,
    };
