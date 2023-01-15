import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProductProvider>().productList();
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
                  ...?productProvider.productLists.map(
                    (e) => SizedBox(
                      width: MediaQuery.of(context).size.width / (2.1),
                      height: 150,
                      child: InkWell(
                        onTap: () {
                          productDialogBuilder(context, e);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Image.network(
                                width: 100,
                                height: 200,
                                fit: BoxFit.cover,
                                e.images!,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e.productName}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                                'Ksh ${e.price}',
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
            ),
    );
  }
}
