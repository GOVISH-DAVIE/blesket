import 'package:blesket/screens/checkout/checkout.dart';
import 'package:blesket/screens/home/home.dart';
import 'package:blesket/screens/login/login.dart';
import 'package:blesket/screens/otp/otp.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.route: (context) => const Login(),
  OTP.route: (context) => const OTP(),
  Checkout.route: (context) => const Checkout(),
  Home.route: (context) => const Home(),
};
