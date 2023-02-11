import 'package:blesket/core/locator.dart';
import 'package:blesket/core/providers.dart';
import 'package:blesket/core/routes.dart';
import 'package:blesket/screens/login/login.dart';
import 'package:blesket/state/sockets/socketsprovider.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLESKET',
      theme: themeData(),
      initialRoute: Login.route,
      routes: routes,
    );
  }
}
