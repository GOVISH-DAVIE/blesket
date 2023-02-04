import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({super.key});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  int? _sId;
  // KeyboardVisibilityNotification _kvn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/brc.png',
          height: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Scan item with barcode reader and place \n item in the cart.',
          textAlign: TextAlign.center,
        ),
        RawKeyboardListener(
            onKey: (value) {
              logger.i('--key press $value');
            },
            focusNode: new FocusNode(),
            child: Text(''))
      ],
    );
  }
}
