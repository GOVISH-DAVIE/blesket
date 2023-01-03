// ignore: file_names

import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
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
            child: Column(
              children: [
                ...?productProvider.cart.map(
                  (e) => SizedBox(
                    width: MediaQuery.of(context).size.width / (2.1),
                    child: ListTile(
                      onTap: () {
                        productDialogBuilder(context, e);
                      },
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            // color: black,
                            image: DecorationImage(
                                image:
                                    NetworkImage(ProductEndPoints.imageLink))),
                      ),
                      title: Text(
                        '${e.productName}',
                      ),
                      // subtitle: const Text('Aisle 23'),
                      trailing: Text(
                        'Ksh ${e.price}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
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
