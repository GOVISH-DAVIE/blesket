 
import 'package:blesket/models/productlist.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
import 'package:blesket/state/product/productendpoints.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatefulWidget {
  final ProductList e;
  Size? imageSize = const Size(300, 300);
  ProductListWidget({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / (2.1),
      height: 150,
      child: InkWell(
        onTap: () {
          productDialogBuilder(context, widget.e, false, Colors.white);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                width: 100,
                height: 200,
                child: Image.network(
                    width: 100, height: 200, fit: BoxFit.cover, widget.e.mobileImage!
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
                // Text(
                //   '${widget.e.isbn}',
                //   style: Theme.of(context).textTheme.titleSmall,
                // ),
              ],
            )),
            SizedBox(
              width: 100,
              child: Text(
                'Ksh ${widget.e.variation?.first.price}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
