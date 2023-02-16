import 'package:blesket/components/buttons.dart';
import 'package:blesket/screens/receipts/receipts.dart';
import 'package:blesket/state/product/productsprovider.dart';
import 'package:blesket/utils/color.dart';
import 'package:blesket/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ConfirmPayment extends StatefulWidget {
  const ConfirmPayment({super.key});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  String? _transCode = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) => _transCode = value,
              decoration: InputDecoration(hintText: "Mpesa Transaction Code"),
            ),
            FullWithButton(
                callback: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<ProductProvider>()
                        .confirmPayment(code: _transCode!)
                        .then((value) {
                      logger.i(value);
                      Navigator.pushNamed(context, Receipt.route);
                    }).catchError((onError) {
                      showDialog<String>(
                        barrierColor: dustred,
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Payment Was Not Successful'),
                          content: const Text('Try Again'),
                        ),
                      );
                    });
                  }
                },
                child: Text('ConFirm Payment'),
                type: outlineButtonDefault)
          ],
        ),
      ),
    );
  }
}
