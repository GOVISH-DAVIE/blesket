import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/checkoutCard/checkoutcard.dart';
import 'package:blesket/screens/receipts/receipts.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Checkout',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Container(
              // padding: EdgeInsetsGeometry(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(1),
                  border: Border(
                      top: BorderSide(
                    color: themeGreen.withOpacity(.3),
                    width: 3.0,
                  ))),

              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/cardicon.png',
                    width: 80,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: themeGrey.withOpacity(.2),
                              border:
                                  Border.all(color: themeGrey.withOpacity(0))),
                          child: const Center(
                            child: Text(
                              'Insert/Swipe card to  pay',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CheckoutCard.route);
                          },
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // image: DecorationImage(

                                // image: AssetImage('',
                                // )
                                // ),
                                border: null),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Ksh 384.00',
                                      style:
                                          TextStyle(color: Color(0xff3A485B)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery charges',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Free!',
                                      style: TextStyle(color: themeGreen),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Coupon',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '-100.00',
                                      style: TextStyle(color: themeGreen),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 20,
                                            width: 124,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: themeGreen),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                'Saved Ksh 100.00',
                                                style: TextStyle(
                                                    color: themeGreen),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Ksh 3872.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                        'Back',
                        style: TextStyle(color: themeGreen),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We accept: ',
                style: TextStyle(color: themeGrey),
              ),
              Image.asset(
                'assets/images/vgroup.png',
                height: 13,
              ),
              Image.asset(
                'assets/images/visa.png',
                height: 13,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'By checking in you agree to the',
                style: TextStyle(color: themeGrey),
              ),
              Text(
                'Terms of use',
                style: TextStyle(color: themeGreen),
              ),
              Text(
                ' of service and privacy policy',
                style: TextStyle(color: themeGrey),
              ),
              Text(
                ' privacy policy',
                style: TextStyle(color: themeGreen),
              )
            ],
          )
        ],
      ),
    );
  }
}
