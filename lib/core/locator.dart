import 'package:blesket/core/api/api.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/state/sockets/socketsprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<Api>(() => Api());
  locator.registerFactory<AuthProvider>(() => AuthProvider());
  locator.registerFactory<ProductProvider>(() => ProductProvider());
  locator.registerFactory<SocketsProvider>(() => SocketsProvider());
}
