import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';

part 'socket_msg.freezed.dart';
part 'socket_msg.g.dart';

@freezed
class SocketMsg with _$SocketMsg {
  factory SocketMsg({
    Data? data,
    String? action,
  }) = _SocketMsg;

  factory SocketMsg.fromJson(Map<String, dynamic> json) =>
      _$SocketMsgFromJson(json);
}
