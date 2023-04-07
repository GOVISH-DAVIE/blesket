import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';

class ScanWidget extends StatefulWidget {
  final Function goToCart;
  const ScanWidget({super.key, required this.goToCart});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  int? _sId;
  // KeyboardVisibilityNotification _kvn;

  FocusNode myfocus = FocusNode();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      myfocus.requestFocus(); //auto focus on second text field.
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
            focusNode: myfocus,
            onSaved: (newValue) => logger.i(newValue),
            onChanged: (value) {
              if (value.length == 13) {
                // logger.i(value.length);
                // logger.i("logger ${value}");
                logger.i(
                    "logger ${context.read<ProductProvider>().productLists.length}");
                context.read<ProductProvider>().productLists.map((e) {
                  logger.i(e.variation);
                });
                
                context.read<ProductProvider>().productLists.where((element) {
                  logger.i(element.variation);
                  return  element.variation?.where((el) => el.isbn == value).length != 0;
                });
                if (context
                    .read<ProductProvider>()
                    .productLists
                    .where((element) =>  element.variation?.where((el) => el.isbn == value).length != 0)
                    .isNotEmpty) {
                  productDialogBuilder(
                      context,
                      context
                          .read<ProductProvider>()
                          .productLists
                          .where((element) =>  element.variation?.where((el) => el.isbn == value).length != 0)
                          .first,
                      true,
                      white);
                  widget.goToCart();
                  context.read<ProductProvider>().addtocartBarCode(
                      productItem: context
                          .read<ProductProvider>()
                          .productLists
                          .where((element) =>  element.variation?.where((el) => el.isbn == value).length != 0)
                          .first);
                }
              }
            },
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            )),
        Image.asset(
          'assets/images/brc.png',
          height: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Scan item with barcode reader and place \n item in the cart.',
          textAlign: TextAlign.center,
        ),
        RawKeyboardListener(
            onKey: (value) {
              logger.i('--key press $value');
            },
            focusNode: new FocusNode(),
            child: Text(''))
      ],
    );
  }
}
