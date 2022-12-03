import 'package:blesket/components/navigation.dart';
import 'package:blesket/utils/color.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigation(),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              width: 79,
              height: 36,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                  child: Text(
                'Cartlist',
                style: TextStyle(fontSize: 16),
              )),
            ),
            Container(
              width: 79,
              height: 36,
              decoration: BoxDecoration(color: themeGrey.withOpacity(.2)),
              child: const Center(
                  child: Text(
                'Storemap',
                style: TextStyle(fontSize: 16),
              )),
            ),
            Container(
              width: 79,
              height: 36,
              decoration: BoxDecoration(color: themeGrey.withOpacity(.2)),
              child: const Center(
                  child: Text(
                'search',
                style: TextStyle(fontSize: 16),
              )),
            ),
          ],
        )
      ]),
    );
  }
}
