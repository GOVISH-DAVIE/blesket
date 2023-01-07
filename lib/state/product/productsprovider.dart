import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/models/cart_list/cart_list.dart';
import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  List<ProductList> _productLists = [];
  List<ProductList> get productLists => _productLists;
  List<ProductList> _cart = [];
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
      return throw false;
    });
  }

  searchProduct({required String value}) {
    logger.i("--provider ${value}");
    _searchProducts = productLists
        .where((element) =>
            element.productName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  addtocartBarCode({required ProductList productItem}) {
    logger.w("--barcode  ${productItem.productName}");
    addToCartProduct(productItem: productItem);
  }
}
