import 'package:blesket/state/product/productsprovider.dart';
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
                  ...?productProvider.productLists?.results!.map(
                    (e) => ListTile(
                      leading: Image.asset('assets/images/1.png'),
                      title: Text(
                        '${e.productName}',
                      ),
                      subtitle: const Text('Aisle 23'),
                      trailing: const Text(
                        'Ksh 255.00',
                        style: TextStyle(fontWeight: FontWeight.w600),
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
