import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/checkout/checkout.dart';
import 'package:blesket/screens/home/components/cartCotainer.dart';
import 'package:blesket/screens/home/components/tabviewContainer.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(context),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),

        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        const SizedBox(
          width: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 100,
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width / 2.1,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/images/logosvg.svg',
                                height: 74, semanticsLabel: 'Acme Logo'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Order Number',
                                    style: TextStyle(color: themeGrey),
                                  ),
                                  Text(' #113-3455716-1901811')
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Order total: Ksh 3,872.00'),
                              SizedBox(
                                height: 10,
                              ),
                              Text('November 3, 2022'),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Divider(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset('assets/images/1.png'),
                          title: const Text(
                            'Nutripro Family Porridge Wimbi Mix',
                          ),
                          subtitle: const Text('Quantity: 1'),
                          trailing: const Text(
                            'Ksh 255.00',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: const Offset(0, 0),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 0),
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: const Offset(0, 0),
                                    ),
                                  ]),
                              height: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Total',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              )),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '12 items',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: themeGrey),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Last shopped',
                                            style: TextStyle(color: themeGrey),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Ksh 3,872.00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Current Price',
                                            style: TextStyle(color: themeGrey),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Ksh 5,632.00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Range',
                                            style: TextStyle(color: themeGrey),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              '-Ksh 546.00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                  height: 400,
                  width: MediaQuery.of(context).size.width / (2.1),
                  color: Colors.white,
                  child: const TabContainer(),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
