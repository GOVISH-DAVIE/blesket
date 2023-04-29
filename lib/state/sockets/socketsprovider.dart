import 'dart:convert';
import 'dart:ffi';

import 'package:blesket/models/productlist.dart';
import 'package:blesket/models/socket_message/socket_message.dart';
import 'package:blesket/models/socket_msg/socket_msg.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/sockets/sockets.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/constants.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SocketsProvider extends ChangeNotifier {
  BuildContext? _context;
  BuildContext? get context => _context;
  SimpleWebSocket? _socket;
  int tries = 0;
  bool _isConnected = false;
  bool get isConnected => _isConnected;

  double currentWeight = 0;
  String productName = '';

  connect({required String signalingUrl, required BuildContext context}) {
    _context = context;
    notifyListeners();
    logger.i('--initiating web sockets');
    _socket = SimpleWebSocket(signalingUrl);
    _socket?.onOpen = () {
      logger.i('--connected Sockets');
      _isConnected = true;
      notifyListeners();
      logger.d('$isConnected');
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
      _isConnected = false;
      notifyListeners();
    };
    _socket?.connect();
  }

  handleOnMessage({dynamic msg}) {
    logger.i('on message $msg');
    logger.i('on message ${msg.runtimeType}');
    SocketMsg socMsg = SocketMsg.fromJson(jsonDecode(msg));
    if (socMsg.data?.statusCode == 1) {
      List<ProductList>? productLists =
          _context?.read<ProductProvider>().productLists;
      // logger.i('--on message ${_context?.read<AuthProvider>().isLoggedIn}');
      logger.i(
          '--on message clean s ${SocketMessage.fromJson(jsonDecode(msg)).data?.productName}');
      String? pName = socMsg.data?.productName?.split(":")[1].trim();
      List<ProductList> plist = _context!
          .read<ProductProvider>()
          .productLists
          .where((element) =>
              element.productName?.toLowerCase() == pName?.toLowerCase())
          .toList();
      logger.i(pName);
      notifyListeners();
      if (plist.isNotEmpty) {
        if (pName != "") {
          logger.i('weignt current $currentWeight');
          logger.i('weignt new ${double.parse(socMsg.data!.weight!)}');
          if ((currentWeight - double.parse(socMsg.data!.weight!) > 5) ||
              ((double.parse(socMsg.data!.weight!) - currentWeight) > 5)) {
            if (currentWeight < double.parse(socMsg.data!.weight!)) {
              currentWeight = double.parse(socMsg.data!.weight!);
              notifyListeners();
              _context
                  ?.read<ProductProvider>()
                  .addToCartProduct(productItem: plist.first);
              productDialogBuilder(_context!, plist.first, true, white);
            } else if (currentWeight > double.parse(socMsg.data!.weight!)) {
              currentWeight = double.parse(socMsg.data!.weight!);
              notifyListeners();

              _context?.read<ProductProvider>().removeFromCart(
                  productSlung: plist.first.slug!,
                  context: null,
                  cartItemId: _context
                      ?.read<ProductProvider>()
                      .cartListModel!
                      .myCart!
                      .where((element) => element.product == plist.first.id)
                      .first
                      .id!);
              productDialogBuilder(_context!, plist.first, false, white);
            }
          }
        }
      }
    }

//     if (_context?.read<AuthProvider>().isLoggedIn == false) {
//       // ScaffoldMessenger.of(_context!)
//       //     .showSnackBar(const SnackBar(content: Text("Login to add to cart")));
//     } else {
//       if ((SocketMessage.fromJson(jsonDecode(msg)).data?.productName == "") ==
//           false) {
//         if (SocketMessage.fromJson(jsonDecode(msg)).data?.statusCode == 0) {
//           if (double.tryParse(
//                   SocketMessage.fromJson(jsonDecode(msg)).data!.weight!)! >
//               currentWeight) {
//             currentWeight = double.tryParse(
//                 SocketMessage.fromJson(jsonDecode(msg)).data!.weight!)!;
//             notifyListeners();
//             _context?.read<ProductProvider>().addToCartProduct(
//                 productItem: _context
//                     ?.read<ProductProvider>()
//                     .productLists
//                     .where((element) => element.productName == productName)
//                     .toList()
//                     .first);
//           } else {
//             currentWeight = double.tryParse(
//                 SocketMessage.fromJson(jsonDecode(msg)).data!.weight!)!;
//             notifyListeners();
//             _context?.read<ProductProvider>().removeFromCart(
//                 productSlung: productLists!
//                     .where((element) => element.productName == productName)
//                     .first
//                     .slug!,
//                 context: null,
//                 cartItemId: _context
//                     ?.read<ProductProvider>()
//                     .cartListModel!
//                     .myCart!
//                     .where((element) =>
//                         element.product ==
//                         productLists!
//                             .where((el) => el.productName == productName)
//                             .first
//                             .id)
//                     .first
//                     .id!);
//           }
//         }

// // SocketMessage.fromJson(jsonDecode(msg)).data?.weight != 0
// //                 ? Future.delayed(const Duration(seconds: 2), () {
// //                     _context
// //                         ?.read<ProductProvider>()
// //                         .addToCartProduct(productItem: _search.first);
// //                   })

//         logger.i(
//             '--on message clean ${SocketMessage.fromJson(jsonDecode(msg)).data?.productName?.split(":")[1]}');

//         List<ProductList>? _search = _context
//             ?.read<ProductProvider>()
//             .productLists
//             .where((element) =>
//                 element.productName?.toLowerCase() ==
//                 SocketMessage.fromJson(jsonDecode(msg))
//                     .data
//                     ?.productName
//                     ?.split(":")[1]
//                     .trim()
//                     .toLowerCase())
//             .toList();
//         logger.i("search length ${_search?.length}");
//         //   logger.i(
//         //       "search length weight ${SocketMessage.fromJson(jsonDecode(msg)).data?.weight}");
//         (_search!.isNotEmpty)
//             ? productName = _search.first.productName!
//             : logger.i('');
//         notifyListeners();
//         logger.i(productName);
//         // } else {
//         //   logger.i('--on message clean no');
//       }
//       // logger.i(
//       //     "--message received ${msg.split('==')[0].trim()} ${_context?.read<AuthProvider>().isLoggedIn}");
//       // List<ProductList>? _p = _context
//       //     ?.read<ProductProvider>()
//       //     .productLists
//       //     .where((element) => element.productName == msg.split('==')[0].trim())
//       //     .toList();
//       // logger.i("product $_p");
//     }
  }
}
