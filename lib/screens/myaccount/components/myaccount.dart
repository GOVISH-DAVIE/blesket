import 'package:blesket/components/buttons.dart';
import 'package:blesket/components/navigation.dart';
import 'package:blesket/screens/invoicehistory/invoicehistory.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:blesket/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'KE';

  PhoneNumber number = PhoneNumber(isoCode: 'KE');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthProvider>().me();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(
        appBar: navigation(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'My Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                    SizedBox(
                      height: 40,
                      width: 173,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sign out',
                            style: TextStyle(color: Colors.red),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )),
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(1),
                      border: Border(
                          top: BorderSide(
                        color: themeBlue.withOpacity(.3),
                        width: 3.0,
                      ))),

                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Profile information',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "${authProvider.profile?.email}"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: themeGrey.withOpacity(.2),
                        width: (MediaQuery.of(context).size.width / 1.5) / 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // crossAxisAlignment: C,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 22,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                decoration: BoxDecoration(
                                                    color: themeGreekBlue
                                                        .withOpacity(.4),
                                                    border: Border.all(
                                                      color: themeBlue,
                                                      width: 1,
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '#R-113-3455716-1901811',
                                                    style: TextStyle(
                                                        color: themeBlue,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child:
                                                  Text('Created on 11/11/2022'),
                                            ),
                                          ],
                                        ),
                                        FullWithButton(
                                          callback: () {
                                            Navigator.pushNamed(
                                                context, InvoiceHistory.route);
                                          },
                                          type: outlineButtonDefault.copyWith(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    themeGrey),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: themeGrey),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            )),
                                          ),
                                          child: const Text("View"),
                                        )
                                      ],
                                    ),
                                    const Divider()
                                  ],
                                ),
                              ),
                            ]),
                      ))
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
}
