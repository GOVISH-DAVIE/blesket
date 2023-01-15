import 'package:blesket/components/buttons.dart';
import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';

import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final Function goToCart;
  const SearchPage({super.key, required this.goToCart});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _scanBarcode = 'Unknown';
  ProductList? _result;
  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print("barcode res ${barcodeScanRes}");
      // logger
      //     .i(Provider.of<ProductProvider>(context, listen: false).productLists);

      // // Provider.of<ProductProvider>(context, listen: false).productLists!
      // ignore: use_build_context_synchronously
      Provider.of<ProductProvider>(context, listen: false)
          .productLists
          .forEach((element) {
        if (barcodeScanRes == element.isbn) {
          Provider.of<ProductProvider>(context, listen: false)
              .addtocartBarCode(productItem: element);
          setState(() {
            _result = element;
          });

          productDialogBuilder(context, element, true);

          widget.goToCart();
        }
      });
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Consumer<ProductProvider>(
        builder: (context, productProvider, child) => Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2.1) * .7,
                        child: TextFormField(
                          onChanged: (value) {
                            productProvider.searchProduct(value: value);
                          },
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Search for product',
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton.extended(
                            backgroundColor: themeGrey,
                            icon: const Icon(Icons.qr_code_scanner),
                            onPressed: () => scanBarcodeNormal(),
                            label: const Text('Scan Bar Code')),
                      )
                          //      IconButton(
                          //   onPressed: () => scanBarcodeNormal(),
                          //   icon: Icon(Icons.qr_code_scanner_sharp),
                          // )
                          )
                    ],
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: context.watch<ProductProvider>().addtoCartBusy
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              ...productProvider.searchProducts.map(
                                (e) => Container(
                                  margin: const EdgeInsets.all(3),
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width / (2.1),
                                  child: ListTile(
                                    onTap: () {
                                      productDialogBuilder(context, e, false);
                                    },
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          // color: black,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  ProductEndPoints.imageLink))),
                                    ),
                                    title: Text(
                                      '${e.productName}',
                                    ),
                                    subtitle: Text(
                                      "KES ${e.price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    trailing: FullWithButton(
                                      callback: () {
                                        productProvider
                                            .addToCartProduct(productItem: e)
                                            .then((value) {
                                          logger.i("respomse  ${value}");
                                          productProvider.cartList();
                                          widget.goToCart();
                                        });
                                      },
                                      type: defaultButtonTheme,
                                      child: Text('Add to cart'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ))
                ])),
      );
    }));
  }
}
