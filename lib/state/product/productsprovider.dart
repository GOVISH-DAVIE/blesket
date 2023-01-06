import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
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

  cartList() async {
    await _api.getHTTP(endpoint: ProductEndPoints.cartList).then((value) {
      logger.i("cart List $value");
    });
  }

  Future addToCartProduct({required ProductList productItem}) async {
    logger.i(productItem);
    return await _api.post(
        endpoint: "${ProductEndPoints.addToCart}${productItem.slug}/",
        params: {
          "quantity": 1,
          "variations": [1],
          "is_active": true
        }).then((value) {
      logger.i("---add to Cart ${value}");
      // _productLists = ProductLists.fromJson(value.data);
      // busy = false;
      // notifyListeners();
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
}
