import 'package:blesket/screens/home/home.dart';
import 'package:blesket/screens/myaccount/myaccount.dart';
import 'package:blesket/state/auth/AuthProvider.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

navigation(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    title: InkWell(
      onTap: () {
        Navigator.pushNamed(context, Home.route);
      },
      child: Image.asset(
        'assets/images/logo.png',
        height: 40,
      ),
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
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, MyAccount.route);
        },
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) =>
              authProvider.profile == null
                  ? CircularProgressIndicator()
                  : Row(
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
                            child: Text(
                              '${authProvider.profile?.email?.substring(0, 1)}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
        ),
      ),
    ],
  );
}
