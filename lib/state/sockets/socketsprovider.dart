import 'dart:ffi';

import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/sockets/sockets.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SocketsProvider extends ChangeNotifier {
  BuildContext? _context;
  SimpleWebSocket? _socket;
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
      logger.wtf('Closed by server [$code => $reason]!');
    };
    _socket?.connect();
  }

  handleOnMessage({required String msg}) {
    if (_context?.read<AuthProvider>().isLoggedIn == false) {
      ScaffoldMessenger.of(_context!)
          .showSnackBar(const SnackBar(content: Text("Login to add to cart")));
    } else {
      logger.i(
          "--message received ${msg.split('==')[0].trim()} ${_context?.read<AuthProvider>().isLoggedIn}");
      List<ProductList>? _p = _context
          ?.read<ProductProvider>()
          .productLists
          .where((element) => element.productName == msg.split('==')[0].trim())
          .toList();
      logger.i("product $_p");
      (_p!.isNotEmpty)
          ? _context
              ?.read<ProductProvider>()
              .addToCartProduct(productItem: _p!.first)
          : logger.i('');
    }
  }
}
