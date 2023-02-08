import 'package:blesket/components/colorSwatch.dart';
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
    BuildContext context, ProductList e, bool? isAdded, Color? color) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color,
        content: AlertDialogContent(
          isAdded: isAdded!,
          e: e,
        ),
        // actionsOverflowButtonSpacing:
        // ,
      );
    },
  );
}

class AlertDialogContent extends StatelessWidget {
  final bool isAdded;
  final ProductList e;
  const AlertDialogContent({
    Key? key,
    required this.isAdded,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        // color: themeBlue,
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width * .8,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(context),
                      icon: Icon(Icons.close))
                ],
              ),
              isAdded == true
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      color: themeGreen.withOpacity(.4),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: SvgPicture.asset('assets/images/done.svg',
                                height: 20, semanticsLabel: 'Acme Logo'),
                          ),
                          Center(child: Text("Item added to  cart")),
                        ],
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width * .8) * .4,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                        child: SizedBox(
                          width:
                              ((MediaQuery.of(context).size.width * .8) * .4) *
                                  .9,
                          height:
                              (MediaQuery.of(context).size.height * .9) * .7,
                          child: Image.network(
                              width: ((MediaQuery.of(context).size.width * .8) *
                                      .4) *
                                  .9,
                              height:
                                  (MediaQuery.of(context).size.height * .9) *
                                      .7,
                              fit: BoxFit.cover,
                              ProductEndPoints.imageLink
                              // e.images!,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width:
                                  (MediaQuery.of(context).size.width / (2.1)) /
                                      1.5,
                              child: const TabBar(
                                padding: EdgeInsets.zero,
                                labelColor: themeGreen,
                                unselectedLabelColor: Colors.black,
                                indicatorColor: themeGreen,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: [
                                  Tab(text: 'Ingredients'),
                                  Tab(
                                    text: 'Nutrition',
                                  ),
                                  Tab(
                                    text: 'Allergies',
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Text(
                              '${e.productName}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Ksh ${e.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 20),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      color: dustred),
                                  child: const Text(
                                    '12%',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
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
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
