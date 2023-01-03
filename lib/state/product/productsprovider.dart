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

  addToCartProduct() async {
    await _api.post(endpoint: ProductEndPoints.addToCart, params: {
      "quantity": 1,
      "variations": [1],
      "is_active": true
    }).then((value) {
      logger.i(value);
      // _productLists = ProductLists.fromJson(value.data);
      // busy = false;
      // notifyListeners();
    });
  }
}
