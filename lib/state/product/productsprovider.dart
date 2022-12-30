import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/models/product_lists/product_lists.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  ProductLists? _productLists;
  ProductLists? get productLists => _productLists;
  bool busy = true;
  productList() async {
    await _api.getHTTP(endpoint: ProductEndPoints.allProducts).then((value) {
      logger.i(value);
      _productLists = ProductLists.fromJson(value.data);
      busy = false;
      notifyListeners();
    });
  }
}
