import 'package:blesket/screens/login/login.dart';
import 'package:blesket/screens/otp/otp.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.route: (context) => const Login(),
  OTP.route: (context) => const OTP()
};
