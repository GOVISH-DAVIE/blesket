import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/models/cart_list/cart_list.dart';
import 'package:blesket/models/mpesa_response/mpesa_response.dart';
import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
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
      _mpesaList = value as List<MpesaResponse>;
    }).catchError((onError) {
      logger.i(onError);
    });
  }

  productList() async {
    await _api.getHTTP(endpoint: ProductEndPoints.allProducts).then((value) {
      logger.i(value);
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
      total = total +
          productLists
                  .where((element) => element.id == e.product)
                  .first
                  .price! *
              e.quantity!;
      logger.i('--total $total');
    });
    return total;
  }

  cartList() async {
    _cartLoading = true;
    notifyListeners();
    await _api.getHTTP(endpoint: ProductEndPoints.cartList).then((value) {
      logger.i("cart List $value");
      _cartItems = CartList.fromJson(value.data);
      // logger.i("--id ${getTotals()}");
      logger.w("${CartList.fromJson(value.data).myCart!}");
      _total = 0;
      notifyListeners();
      for (var i = 0; i < CartList.fromJson(value.data).myCart!.length; i++) {
        logger.e('ccdc ${CartList.fromJson(value.data).myCart![i]}');
        _total = _total +
            (_productLists
                    .where((element) =>
                        element.id ==
                        CartList.fromJson(value.data).myCart![i].product)
                    .first
                    .price! *
                CartList.fromJson(value.data).myCart![i].quantity!);
        notifyListeners();
        logger.w('totals $total');
      }
      _cartLoading = false;
      notifyListeners();
    }).catchError((onError) {
      _cartLoading = false;
      notifyListeners();
    });
  }

  Future addToCartProduct({required ProductList productItem}) async {
    logger.i(productItem);
    _addtoCartBusy = true;
    notifyListeners();
    return await _api.post(
        endpoint: "${ProductEndPoints.addToCart}${productItem.slug}/",
        params: {
          "quantity": 1,
          "variations": [1],
          "is_active": true
        }).then((value) {
      logger.i("---add to Cart ${value}");
      cartList();
      // _productLists = ProductLists.fromJson(value.data);
      _addtoCartBusy = false;
      notifyListeners();

      return true;
    }).catchError((onError) {
      logger.i(onError);
      _addtoCartBusy = false;
      notifyListeners();
      return throw false;
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
      ProductList product = productLists
          .where(
              (element) => element.isbn!.toLowerCase() == value.toLowerCase())
          .toList()
          .first;
      addToCartProduct(productItem: product).then((value) {
        productDialogBuilder(context, product, true);
        cartList();

        // goToCart();
      });
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

  makeOrder({required String pNumber}) async {
    logger.i('--number $pNumber');
    _addtoCartBusy = true;
    notifyListeners();

    return await _api.post(
        endpoint: "${ProductEndPoints.makePayment}20230107125817jakey/",
        params: {
          "first_name": "Jacob",
          "last_name": "Miru",
          "phone": pNumber,
          "email": "gakungajake@gmail.com",
          "address_line_1": "Roysambu",
          "address_line_2": "Lumumba drive",
          "country": "Kenya",
          "state": "Nairobi",
          "city": "Nairobi",
          "order_note": "Best"
        }).then((value) {
      logger.w('--making order ${value.data}');
      _addtoCartBusy = true;
      notifyListeners();
    }).catchError((onError) {
      _addtoCartBusy = true;
      notifyListeners();
      logger.i(onError);
    });
    // return await _api.post(endpoint: "${ProductEndPoints.makeOrder}", params: {
    //   "first_name": "Jacob",
    //   "last_name": "Miru",
    //   "phone": pNumber,
    //   "email": "gakungajake@gmail.com",
    //   "address_line_1": "Roysambu",
    //   "address_line_2": "Lumumba drive",
    //   "country": "Kenya",
    //   "state": "Nairobi",
    //   "city": "Nairobi",
    //   "order_note": "Best"
    // }).then((value) {
    //   logger.w('--making order ${value.data}');
    //   _addtoCartBusy = true;
    //   notifyListeners();
    // }).catchError((onError) {
    //   _addtoCartBusy = true;
    //   notifyListeners();
    //   logger.i(onError);
    // });
  }
}
