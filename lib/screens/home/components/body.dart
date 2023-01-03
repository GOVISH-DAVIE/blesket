import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/checkout/checkout.dart';
import 'package:blesket/screens/home/components/cartCotainer.dart';
import 'package:blesket/screens/home/components/search.dart';
import 'package:blesket/screens/home/components/tabviewContainer.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ProductProvider>().productList();
  }

  String activeTab = 'cartlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(context),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 100,
            ),
            activeTab == 'cartlist'
                ? Row(children: [
                    Container(
                      width: 79,
                      height: 36,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Center(
                          child: Text(
                        'Cartlist',
                        style: TextStyle(fontSize: 16),
                      )),
                    ),
                    Container(
                      width: 79,
                      height: 36,
                      decoration:
                          BoxDecoration(color: themeGrey.withOpacity(.2)),
                      child: const Center(
                          child: Text(
                        'Storemap',
                        style: TextStyle(fontSize: 16),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          activeTab = 'search';
                        });
                      },
                      child: Container(
                        width: 79,
                        height: 36,
                        decoration:
                            BoxDecoration(color: themeGrey.withOpacity(.2)),
                        child: const Center(
                            child: Text(
                          'search',
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                  ])
                : Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          activeTab = 'cartlist';
                        });
                      },
                      child: Container(
                        width: 79,
                        height: 36,
                        decoration:
                            BoxDecoration(color: themeGrey.withOpacity(.2)),
                        child: const Center(
                            child: Text(
                          'Cartlist',
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                    Container(
                      width: 79,
                      height: 36,
                      decoration:
                          BoxDecoration(color: themeGrey.withOpacity(.2)),
                      child: const Center(
                          child: Text(
                        'Storemap',
                        style: TextStyle(fontSize: 16),
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          activeTab = 'search';
                        });
                      },
                      child: Container(
                        width: 79,
                        height: 36,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Center(
                            child: Text(
                          'search',
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                  ]),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Show ratings',
                    style: TextStyle(color: Color(0xff262626)),
                  ),
                  Switch(
                      value: false,
                      onChanged: (value) {
                        return;
                      }),
                  const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width / 2.1,
                  color: Colors.white,
                  child: activeTab == "cartlist"
                      ? CartContainer()
                      : SearchPage(goToCart: () {
                          setState(() {
                            activeTab = 'cartlist';
                          });
                        }),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Subtotal'),
                      Text('Ksh 3872.00'),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Coupon'),
                      Text('.00'),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.1,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 124,
                              decoration: BoxDecoration(
                                  border: Border.all(color: themeGreen),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Saved Ksh 100.00',
                                  style: TextStyle(color: themeGreen),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Ksh 3872.00',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width / (2.1),
                  color: Colors.white,
                  child: const TabContainer(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: themeGreen),
                    width: MediaQuery.of(context).size.width / (2.1),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Checkout.route);
                        },
                        child: const Text(
                          'checkout',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
