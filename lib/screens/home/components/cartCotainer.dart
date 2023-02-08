// ignore: file_names

import 'package:blesket/components/buttons.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
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
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      ...?productProvider.cartItems?.myCart?.map(
                        (e) => SizedBox(
                          width: MediaQuery.of(context).size.width / (2.1),
                          height: 150,
                          child: InkWell(
                            onTap: () {
                              productDialogBuilder(
                                  context,
                                  productProvider.productLists
                                      .where(
                                          (element) => element.id == e.product)
                                      .first,
                                  true,
                                  white);
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
                                        // productProvider.productLists
                                        //     .where((element) =>
                                        //         element.id == e.product)
                                        //     .first
                                        //     .images!,
                                        ),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${productProvider.productLists.where((element) => element.id == e.product).first.productName}',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                    'Ksh ${productProvider.productLists.where((element) => element.id == e.product).first.price! * e.quantity!}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
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
