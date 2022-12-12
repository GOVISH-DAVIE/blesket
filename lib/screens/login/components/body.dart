import 'package:blesket/screens/otp/otp.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Check in',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 560,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Container(
              // padding: EdgeInsetsGeometry(),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(1),
                  border: Border(
                      top: BorderSide(
                    color: Color(0xffB0A8EC),
                    width: 3.0,
                  ))),
              child: maincomponent(context),
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

  Column maincomponent(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        height: 56,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/step.png',
              height: 56,
            ),
            Image.asset(
              'assets/images/st2.png',
              height: 56,
            ),
          ],
        ),
      ),
      Expanded(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 350,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...[1, 2, 3].map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 52,
                            width: 109,
                            decoration: BoxDecoration(
                                color: const Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  '$e',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ))),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...[4, 5, 6].map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 52,
                            width: 109,
                            decoration: BoxDecoration(
                                color: const Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  '$e',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ))),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...[7, 8, 9].map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 52,
                            width: 109,
                            decoration: BoxDecoration(
                                color: const Color(0xffEEEEEE),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  '$e',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ))),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, OTP.route);
                    },
                    child: Image.asset(
                      'assets/images/correctbtn.png',
                      height: 52,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 52,
                        width: 109,
                        decoration: BoxDecoration(
                            color: const Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              '0',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ))),
                  ),
                  Image.asset(
                    'assets/images/cancel.png',
                    height: 52,
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
