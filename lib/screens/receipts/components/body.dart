import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/receipts/components/popsup.dart';
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
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/doneicon.png',
                    height: 24,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Payment successful!',
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
                          onTap: () {},
                          child: Container(
                            height: 96,
                            width: 112,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: themeGrey.withOpacity(.3))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/viewReceipt.svg',
                                    semanticsLabel: 'Acme Logo'),
                                const Text(
                                  'View receipt',
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
                            dialogBuilder(context);
                            // Navigator.pushNamed(context, CheckoutCard.route);
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
                                SvgPicture.asset('assets/images/email.svg',
                                    semanticsLabel: 'Acme Logo'),
                                const Text(
                                  'Email receipt',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
