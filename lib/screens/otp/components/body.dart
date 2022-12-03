import 'package:blesket/screens/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 350, child: TextFormField()),
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
        )
      ]),
    );
  }
}
