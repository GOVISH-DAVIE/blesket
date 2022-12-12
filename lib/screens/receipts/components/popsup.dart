import 'package:blesket/screens/receipts/receipts.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Email receipt'),
        content: Container(
          height: 300,
          width: 500,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/warning.svg',
                    height: 74, semanticsLabel: 'Acme Logo'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Confirm receipt to send to',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'janetmbugua@gmail.com',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themeGrey),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
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
                        'Cancel',
                        style: TextStyle(color: themeGreen),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Receipt.route);
                      },
                      child: Container(
                        height: 40,
                        width: 173,
                        decoration: BoxDecoration(
                            color: themeGreen,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: themeGreen)),
                        child: Center(
                            child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // actionsOverflowButtonSpacing:
        // ,
      );
    },
  );
}
