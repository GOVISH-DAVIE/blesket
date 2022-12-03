import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';

AppBar navigation() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Image.asset(
      'assets/images/logo.png',
      height: 40,
    ),
    actions: [
      Row(
        children: const [
          Text(
            'Help',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.info,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      Row(
        children: [
          const Text(
            'My Account',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: themeGreen.withOpacity(.6),
              radius: 20,
              child: const Text(
                'J',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    ],
  );
}
