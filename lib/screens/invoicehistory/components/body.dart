import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/invoicehistory/invoicehistory.dart';
import 'package:flutter/material.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';

  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 173,
                    decoration: BoxDecoration(
                        border: Border.all(color: themeGrey),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                        child: Text(
                      'Back',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff434343)),
                    )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Container(
              // padding: EdgeInsetsGeometry(),

              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(1),
                  border: Border(
                      top: BorderSide(
                    color: themeBlue.withOpacity(.3),
                    width: 3.0,
                  ))),

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
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          padding: const EdgeInsets.all(8.0),
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
