import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/checkoutCard/checkoutcard.dart';
import 'package:blesket/screens/checkoutMpesa/checkoutMpesa.dart';
import 'package:blesket/screens/receipts/receipts.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? _tabController;
  int index = 0;
  String? pNumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(context),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
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
                        height: 60,
                      ),
                      Image.asset(
                        'assets/images/mpesa.png',
                        height: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _tabController?.index = 0;
                                setState(() {
                                  index = 0;
                                });
                              },
                              child: Container(
                                height: 56,
                                width: 162,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? themeBlue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: themeGrey.withOpacity(.4))),
                                child: Center(
                                  child: Text(
                                    'M-PESA Express',
                                    style: TextStyle(
                                        color: index == 0
                                            ? Colors.white
                                            : themeGrey),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  _tabController?.index = 1;

                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                  height: 56,
                                  width: 162,
                                  decoration: BoxDecoration(
                                      color: index == 1
                                          ? themeBlue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: themeGrey.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'Lipa na M-PESA',
                                      style: TextStyle(
                                        color: index != 1
                                            ? themeGrey
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _tabController?.index = 2;

                                setState(() {
                                  index = 2;
                                });
                              },
                              child: Container(
                                height: 56,
                                width: 162,
                                decoration: BoxDecoration(
                                    color: index == 2
                                        ? themeBlue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: themeGrey.withOpacity(.4))),
                                child: Center(
                                  child: Text(
                                    'M-PESA Paybill',
                                    style: TextStyle(
                                      color:
                                          index != 2 ? themeGrey : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 230,
                        width: 400,
                        child: index == 2
                            ? pabill()
                            : index == 1
                                ? lipaNaMpesa()
                                : Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'MPESA Express',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Pay now via M-PESA ',
                                          style: TextStyle(
                                              color: themeGrey, fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        'You will receive an M-PESA push notification to  ',
                                        style: TextStyle(
                                            color: themeGrey, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        onChanged: (value) => pNumber = value,
                                        decoration: InputDecoration(
                                            hintText: 'Mpesa Phone Number'),
                                      ),
                                    ],
                                  ),
                      ),
                      SizedBox(
                        height: 20,
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
                                'Back ',
                                style: TextStyle(color: themeGreen),
                              )),
                            ),
                          ),
                          index == 0
                              ? InkWell(
                                  onTap: () {
                                    context
                                        .read<ProductProvider>()
                                        .makeOrder(pNumber: pNumber!);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 40,
                                      width: 173,
                                      decoration: BoxDecoration(
                                          color: themeGreen,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border:
                                              Border.all(color: themeGreen)),
                                      child: Center(
                                          child: Text(
                                        'Initiate payment ',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
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
        ),
      ),
    );
  }

  Column lipaNaMpesa() {
    return Column(
      children: [
        const Text(
          'Lipa na M-PESA',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '1 Go to MPESA menu \n Select “Lipa na MPESA” \n Select buy goods and services \n Enter Till number  345700 \n Enter Amount Ksh 3450.00 \n Enter your M-Pesa PIN \n Payment request will come from “BIG6 supermarket” \n Confirm and proceed to pay  ',
          style: TextStyle(
            fontSize: 16,
            color: themeGrey,
          ),
        ),
        // Text('data')
      ],
    );
  }

  Column pabill() {
    return Column(
      children: [
        const Text(
          'MPESA Paybill',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Go to MPESA menu \n Select “Lipa na MPESA” \n Select Paybill \n Enter PayBill number 345700 \n Enter account number 0700567890  \n Enter Amount Ksh 3450.00  \n Enter your M-Pesa PIN \n Payment request will come from “BIG6 supermarket” \n Confirm and proceed to pay ",
          style: TextStyle(
            fontSize: 16,
            color: themeGrey,
          ),
        ),
        // Text('data')
      ],
    );
  }
}
