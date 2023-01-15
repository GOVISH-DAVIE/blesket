import 'package:blesket/models/product_list/product_list.dart';
import 'package:blesket/screens/receipts/receipts.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Email receipt'),
        content: SizedBox(
          height: 300,
          width: 500,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/warning.svg',
                    height: 74, semanticsLabel: 'Acme Logo'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Confirm receipt to send to',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'janetmbugua@gmail.com',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themeGrey),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Receipt.route);
                    },
                    child: Container(
                      height: 40,
                      width: 173,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: themeGreen)),
                      child: Center(
                          child: Text(
                        'Cancel',
                        style: TextStyle(color: themeGreen),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Receipt.route);
                      },
                      child: Container(
                        height: 40,
                        width: 173,
                        decoration: BoxDecoration(
                            color: themeGreen,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: themeGreen)),
                        child: Center(
                            child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // actionsOverflowButtonSpacing:
        // ,
      );
    },
  );
}

Future<void> productDialogBuilder(
    BuildContext context, ProductList e, bool? isAdded) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Product details'),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .9,
          width: MediaQuery.of(context).size.width * .3,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  color: themeGreen.withOpacity(.4),
                  child: Center(child: Text("Added to Cart")),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.network(
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    e.images!,
                  ),
                ),
                Text(
                  '${e.productName}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ksh ${e.price}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          color: Colors.red.withOpacity(.2)),
                      child: const Text(
                        '12%',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: Text(
                    "Carbonated water, Sugar, Phospohic acid, Caffeine",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: themeGrey.withOpacity(.1)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Recommended items',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Consumer<ProductProvider>(
                  builder: (context, productProvider, child) =>
                      SingleChildScrollView(
                    child: Column(
                      children: [
                        ...?productProvider.productLists.map(
                          (e) => SizedBox(
                            width: MediaQuery.of(context).size.width / (2.1),
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
                              subtitle: const Text('Aisle 23'),
                              trailing: Text(
                                'Ksh ${e.price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
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
                  ),
                ))
              ],
            ),
          ),
        ),
        // actionsOverflowButtonSpacing:
        // ,
      );
    },
  );
}
