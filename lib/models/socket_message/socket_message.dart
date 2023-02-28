import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'socket_message.freezed.dart';
part 'socket_message.g.dart';

@freezed
class SocketMessage with _$SocketMessage {
  factory SocketMessage({
    Data? data,
    String? action,
  }) = _SocketMessage;

  factory SocketMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketMessageFromJson(json);
}
