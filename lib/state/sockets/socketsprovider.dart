import 'dart:convert';
import 'dart:ffi';

import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/models/socket_message/socket_message.dart';
import 'package:blesket/sockets/sockets.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/constants.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SocketsProvider extends ChangeNotifier {
  BuildContext? _context;
  BuildContext? get context => _context;
  SimpleWebSocket? _socket;
  int tries = 0;
  connect({required String signalingUrl, required BuildContext context}) {
    _context = context;
    notifyListeners();
    logger.i('--initiating web sockets');
    _socket = SimpleWebSocket(signalingUrl);
    _socket?.onOpen = () {
      logger.i('--connected Sockets');
    };
    _socket?.onMessage = (msg) => handleOnMessage(msg: msg);
    _socket?.onClose = (int? code, String? reason) {
      if (tries < 100) {
        logger.i('tries $tries');
        connect(signalingUrl: signalingEndPoint, context: _context!);
        tries = tries + 1;
        logger.i('tries $tries');
        logger.wtf('Closed by server [$code => $reason]!');
      } else {
        ScaffoldMessenger.of(_context!).showSnackBar(SnackBar(
            content: Text('Error connecting to the Socket Server $tries')));
      }
    };
    _socket?.connect();
  }

  handleOnMessage({dynamic msg}) {
    // logger.i('--on message ${_context?.read<AuthProvider>().isLoggedIn}');
    logger.i(
        '--on message clean ${SocketMessage.fromJson(jsonDecode(msg)).data?.productName?.split(":")[1].trim()}');

    if (_context?.read<AuthProvider>().isLoggedIn == false) {
      // ScaffoldMessenger.of(_context!)
      //     .showSnackBar(const SnackBar(content: Text("Login to add to cart")));
    } else {
      if ((SocketMessage.fromJson(jsonDecode(msg))
                  .data
                  ?.productName
                  ?.split(":")[1]
                  .trim() ==
              "") ==
          false) {
        logger.i(
            '--on message clean ${SocketMessage.fromJson(jsonDecode(msg)).data?.productName?.split(":").last.trim()}');

        List<ProductList>? _search = _context
            ?.read<ProductProvider>()
            .productLists
            .where((element) =>
                element.productName?.toLowerCase() ==
                SocketMessage.fromJson(jsonDecode(msg))
                    .data
                    ?.productName
                    ?.split(":")
                    .last
                    .trim()
                    .toLowerCase())
            .toList();
        logger.i("search length ${_search?.length}");
        logger.i(
            "search length weight ${SocketMessage.fromJson(jsonDecode(msg)).data?.weight}");
        (_search!.isNotEmpty)
            ? SocketMessage.fromJson(jsonDecode(msg)).data?.weight != 0
                ? Future.delayed(Duration(seconds: 2), () {
                    _context
                        ?.read<ProductProvider>()
                        .addToCartProduct(productItem: _search.first);
                  })
                : null
            : logger.i('');
      } else {
        logger.i('--on message clean no');
      }
      // logger.i(
      //     "--message received ${msg.split('==')[0].trim()} ${_context?.read<AuthProvider>().isLoggedIn}");
      // List<ProductList>? _p = _context
      //     ?.read<ProductProvider>()
      //     .productLists
      //     .where((element) => element.productName == msg.split('==')[0].trim())
      //     .toList();
      // logger.i("product $_p");

    }
  }
}
