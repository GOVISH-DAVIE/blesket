import 'dart:convert';

import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/models/CartListModel.dart';
import 'package:blesket/models/cart_list/cart_list.dart';
import 'package:blesket/models/mpesa_response/mpesa_response.dart';
import 'package:blesket/models/productlist.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  final List<ProductList> _productLists = [];
  List<ProductList> get productLists => _productLists;
  final List<ProductList> _cart = [];
  List<ProductList> get cart => _cart;
  List<ProductList> _searchProducts = [];
  List<ProductList> get searchProducts => _searchProducts;
  CartListModel? _cartListModel;
  CartListModel? get cartListModel => _cartListModel;
  CartList? _cartItems;
  CartList? get cartItems => _cartItems;
  int _total = 0;
  int get total => _total;

  bool _addtoCartBusy = false;
  bool get addtoCartBusy => _addtoCartBusy;

  bool _cartLoading = false;
  bool get cartLoading => _cartLoading;

  bool busy = true;
  List<MpesaResponse> _mpesaList = [];
  List<MpesaResponse> get mpesaList => _mpesaList;

  getMpesa() async {
    await _api.getHTTP(endpoint: ProductEndPoints.mpesaList).then((value) {
      logger.i(value);
      // _mpesaList = value as List<MpesaResponse>;
    }).catchError((onError) {
      logger.i(onError);
    });
  }

  productList() async {
    await _api.getHTTP(endpoint: ProductEndPoints.allProducts).then((value) {
      logger.i(value);
      _productLists.clear();
      notifyListeners();
      for (var i = 0; i < value.data.length; i++) {
        _productLists.add(ProductList.fromJson(value.data[i]));
      }
      // _productLists = (value.data as List<ProductList>);
      busy = false;
      notifyListeners();
    });
  }

  int getTotals() {
    int total = 0;
    _cartItems?.myCart?.map((e) {
      // total = total +
      //     productLists
      //             .where((element) => element.id == e.product)
      //             .first.variation
      //             .price! *
      //         e.quantity!;
      logger.i('--total $total');
    });
    return total;
  }

  cartList() async {
    _cartLoading = true;
    notifyListeners();
    await _api.getHTTP(endpoint: ProductEndPoints.addToCart).then((value) {
      logger.i("cart List $value ");
      // logger.i("--id ${getTotals()}");
      _total = 0;
      notifyListeners();
      _cartListModel = CartListModel.fromJson(value.data);
      logger.i("checking my cart ${CartListModel.fromJson(value.data).myCart}");
      for (var i = 0; i < CartListModel.fromJson(value.data).myCart!.length; i++) {
        _total = _total + int.parse("${productLists.where((element) => element.id == CartListModel.fromJson(value.data).myCart![i].product).first.variation?.where((element) => element.id ==  CartListModel.fromJson(value.data).myCart![i].variations).first.price}");
      }
      CartListModel.fromJson(value.data).myCart?.map((e) {
        logger.i(
            "cart List totals ${productLists.where((element) => element.id == e.product).first.variation?.where((element) => element.id == e.variations).first.price}");
        _total = _total +
            int.parse(
                "${productLists.where((element) => element.id == e.product).first.variation?.where((element) => element.id == e.variations).first.price}");
      });
      _cartLoading = false;
      notifyListeners();
    }).catchError((onError) {
      logger.i('cart list error $onError');
      _cartLoading = false;
      notifyListeners();
    });
  }

  Future addToCartProduct({required ProductList productItem}) async {
    logger.i(productItem);
    logger.i({
      "quantity": 1,
      "product": productItem.id,
      "variations": productItem.variation?.first.id,
      "is_active": true
    });
    _addtoCartBusy = true;
    notifyListeners();
    return await _api
        .post(
            endpoint: ProductEndPoints.addToCart,
            params:{
      "quantity": 1,
      "product": productItem.id,
      "variations": productItem.variation?.first.id,
      "is_active": true
    },
            isjson: true)
        .then((value) {
      logger.i("---add to Cart ${value}");
      cartList();
      // _productLists = ProductLists.fromJson(value.data);
      _addtoCartBusy = false;
      notifyListeners();

      return true;
    }).catchError((onError) {
      logger.i("alot 500 ${onError}");
      _addtoCartBusy = false;
      notifyListeners();
      return false;
    });
  }

  searchProduct({required String value}) {
    logger.i("--provider ${value}");
    if (value == "") {
      _searchProducts.clear();
    } else {
      _searchProducts.clear();
      _searchProducts = productLists
          .where((element) =>
              element.productName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      logger.i("--provider ${_searchProducts}");
    }

    notifyListeners();
  }

  searchProductBarCode(
      {required String value,
      required BuildContext context,
      required Function goToCart}) {
    logger.i("--provider ${value}");
    if (value == "") {
    } else {
      // ProductList product = productLists
      //     .where(
      //         (element) => element.isbn!.toLowerCase() == value.toLowerCase())
      //     .toList()
      //     .first;
      // addToCartProduct(productItem: product).then((value) {
      //   productDialogBuilder(context, product, true, white);
      //   cartList();

      //   // goToCart();
      // });
    }

    notifyListeners();
  }

  addtocartBarCode({required ProductList productItem}) {
    logger.w("--barcode  ${productItem.productName}");
    addToCartProduct(productItem: productItem);
  }

  me() async {
    await _api.getHTTP(endpoint: ProductEndPoints.me).then((value) {
      logger.i("--me $value");
      // _cartItems = CartList.fromJson(value.data);
    }).catchError((onError) {
      logger.w(onError);
    });
  }

  Future makeOrder({required String pNumber}) async {
    logger.i('--number $pNumber');
    _addtoCartBusy = true;
    notifyListeners();

    return await _api
        .post(
            endpoint: ProductEndPoints.makeOrder,
            params: {
              "phone": pNumber,
            },
            isjson: true)
        .then((value) {
      logger.w('--making order ${value.data}');
      _addtoCartBusy = true;
      notifyListeners();
      return true;
    }).catchError((onError) {
      _addtoCartBusy = true;
      notifyListeners();
      logger.i(onError);
      return throw onError;
    });
  }

  removeFromCart({
    required String productSlung,
    required int cartItemId,
    required BuildContext context
  }) async {
    return await _api
        .delete(
            endpoint:
                "${ProductEndPoints.removeItem}$productSlung/$cartItemId/")
        .then((value) {
      logger.i("--removing cart ${value.data}");
      cartList();

                                                  Navigator.of(context).pop();
    }).catchError((onError) {
      logger.e("--removing cart error $onError");

                                                  Navigator.of(context).pop();
      return throw onError;
    });
  }

  Future confirmPayment({required String code}) async {
    return await _api
        .getHTTP(endpoint: "${ProductEndPoints.confirmPayment}?search=$code")
        .then((value) {
      logger.i("server response $value");
      List<MpesaResponse> res = [];
      for (var i = 0; i < value.data.length; i++) {
        res.add(MpesaResponse.fromJson(value.data[i]));
      }
      // ignore: prefer_is_empty
      return res
                  .where((element) =>
                      element.mpesaCode!.toLowerCase() == code.toLowerCase())
                  .toList()
                  .length >
              0
          ? res
              .where((element) =>
                  element.mpesaCode!.toLowerCase() == code.toLowerCase())
              .toList()
          : throw false;
    }).catchError((onError) {
      logger.e('error $onError');
      return throw false;
    });
  }
}
