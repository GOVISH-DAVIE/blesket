import 'package:blesket/sockets/sockets.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class SocketsProvider extends ChangeNotifier {
  SimpleWebSocket? _socket;
  connect({required String signalingUrl}) {
    logger.i('--initiating web sockets');
    _socket = SimpleWebSocket(signalingUrl);
    _socket?.onOpen = () {
      logger.i('--connected Sockets');
    };
    _socket?.onMessage = (msg) {
      logger.i("--message received $msg");
    };
    _socket?.onClose = (int? code, String? reason) {
      print('Closed by server [$code => $reason]!');
    };
    _socket?.connect();
  }
}
