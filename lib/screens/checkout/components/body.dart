import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/checkoutCard/checkoutcard.dart';
import 'package:blesket/screens/checkoutMpesa/checkoutMpesa.dart';
import 'package:blesket/screens/receiptfeedback/receiptfeedback.dart';
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
    context.read<ProductProvider>().getMpesa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Checkout',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
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
                    height: 100,
                  ),
                  const Text(
                    'Select payment method',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Select your preferred payment method',
                    style: TextStyle(color: themeGrey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CheckoutMpesa.route);
                          },
                          child: Container(
                            height: 96,
                            width: 112,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // image: DecorationImage(

                                // image: AssetImage('',
                                // )
                                // ),
                                border: Border.all(
                                    color: themeGrey.withOpacity(.3))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/mpesa.png',
                                  height: 24,
                                  width: 70,
                                ),
                                Text(
                                  'MPESA',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
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
                            height: 96,
                            width: 112,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // image: DecorationImage(

                                // image: AssetImage('',
                                // )
                                // ),
                                border: Border.all(
                                    color: themeGrey.withOpacity(.2))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/cardicon.png',
                                  height: 24,
                                  width: 70,
                                ),
                                const Text(
                                  'CARD',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
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
                      Navigator.pushNamed(context, ReceiptFeedback.route);
                    },
                    child: Container(
                      height: 40,
                      width: 173,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: themeGreen)),
                      child: Center(
                          child: Text(
                        'Continue Shopping',
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
