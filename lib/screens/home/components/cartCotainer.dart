// ignore: file_names

import 'package:blesket/components/buttons.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/state/sockets/socketsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/constants.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatefulWidget {
  const CartContainer({super.key});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FullWithButton(
              callback: () {
                context
                    .read<SocketsProvider>()
                    .connect(signalingUrl: signalingEndPoint, context: context);
              },
              type: outlineButtonDefault,
              child: const Text('connect socket')),
          FullWithButton(
              callback: () {
                logger.i('message');
                context.read<SocketsProvider>().handleOnMessage(msg: {
                  "data": {
                    "id": 11,
                    "product_name": "Delmonte",
                    "weight": "0.0000000000",
                    "status_code": 1
                  },
                  "action": "update"
                });
              },
              type: outlineButtonDefault,
              child: const Text('simulate handle mesage')),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: context.watch<ProductProvider>().cartLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ...?productProvider.cartListModel?.myCart?.map(
                        (e) => Dismissible(
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: dustred,
                                  title: const Text("Cart "),
                                  content: const Text(
                                      "Are you sure you want to remove this item from the cart?"),
                                  actions: <Widget>[
                                    FullWithButton(
                                        type: defaultButtonTheme,
                                        callback: () {
                                          context
                                              .read<ProductProvider>()
                                              .removeFromCart(
                                                  productSlung: productProvider
                                                      .productLists
                                                      .where((element) =>
                                                          element.id ==
                                                          e.product)
                                                      .first
                                                      .slug!,
                                                  cartItemId: e.id!,
                                                  context: context);
                                        },
                                        // Navigator.of(context).pop(true),
                                        child: const Text("Yes")),
                                    FullWithButton(
                                      type: inactiveButtonTheme,
                                      callback: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("No"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          key: Key('item ${e.toJson()}'),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / (2.1),
                            height: 150,
                            child: InkWell(
                              onTap: () {
                                productDialogBuilder(
                                    context,
                                    productProvider.productLists
                                        .where((element) =>
                                            element.id == e.product)
                                        .first,
                                    true,
                                    white);
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: SizedBox(
                                      width: 100,
                                      height: 200,
                                      child: Image.network(
                                        width: 100,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        // ProductEndPoints.imageLink
                                        productProvider.productLists
                                            .where((element) =>
                                                element.id == e.product)
                                            .first
                                            .mobileImage!,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${productProvider.productLists.where((element) => element.id == e.product).first.productName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        ' Quantity : ${e.quantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  )),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Ksh ${productProvider.productLists.where((element) => element.id == e.product).first.variation?.where((element) => element.id == e.variations).first.price}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Divider(),
                      ),
                    ],
                  ),
          ))
        ],
      ),
    );
  }
}
