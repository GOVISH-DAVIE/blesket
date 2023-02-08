import 'package:blesket/components/buttons.dart';
import 'package:blesket/components/colorSwatch.dart';
import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import 'package:palette_generator/palette_generator.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  String _scanBarcode = 'Unknown';
  ProductList? _result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProductProvider>().productList();
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

          productDialogBuilder(context, element, true, white);
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
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) => productProvider.busy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2.1) * .9,
                          child: TextFormField(
                            onChanged: (value) {
                              productProvider.searchProduct(value: value);
                            },
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Search product',
                                prefixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                      children: productProvider.searchProducts.length > 1
                          ? productProvider.searchProducts
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.all(3),
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width / (2.1),
                                  child: ListTile(
                                    onTap: () {
                                      productDialogBuilder(
                                          context, e, false, white);
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
                                        });
                                      },
                                      type: defaultButtonTheme,
                                      child: Text('Add to cart'),
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : productProvider.productLists
                              .map(
                                (e) => ProductListWidget(
                                  e: e,
                                ),
                              )
                              .toList()),
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0, right: 18),
                    child: Divider(),
                  ),
                ],
              ),
            ),
    );
  }
}

class ProductListWidget extends StatefulWidget {
  final ProductList e;
  Size? imageSize = Size(200, 200);
  ProductListWidget({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListWidget> {
  Rect? region;

  PaletteGenerator? paletteGenerator;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.imageSize != null) {
      region = Offset.zero & widget.imageSize!;
    }
    _updatePaletteGenerator(region);
  }

  Future<void> _updatePaletteGenerator(Rect? newRegion) async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(ProductEndPoints.imageLink
          // e.images!,
          ),
      size: widget.imageSize,
      region: newRegion,
      maximumColorCount: 20,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / (2.1),
      height: 150,
      child: InkWell(
        onTap: () {
          productDialogBuilder(
              context, widget.e, false, paletteGenerator?.colors.first);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 100,
                height: 200,
                child: Image.network(
                    width: 100,
                    height: 200,
                    fit: BoxFit.cover,
                    ProductEndPoints.imageLink
                    // e.images!,
                    ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.e.productName}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Aisle 23',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            )),
            SizedBox(
              width: 100,
              child: Text(
                'Ksh ${widget.e.price}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
