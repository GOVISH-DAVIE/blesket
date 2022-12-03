import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            child: Container(
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
                      Image.asset(
                        'assets/images/correctbtn.png',
                        height: 52,
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
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black),
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
          ),
        )
      ]),
    );
  }
}
