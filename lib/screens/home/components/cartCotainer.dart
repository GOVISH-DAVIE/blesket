import 'package:flutter/material.dart';

class CartContainer extends StatefulWidget {
  const CartContainer({super.key});

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'My Cart',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/images/1.png'),
          title: const Text(
            'Nutripro Family Porridge Wimbi Mix',
          ),
          subtitle: const Text('Quantity: 1'),
          trailing: const Text(
            'Ksh 255.00',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18),
          child: Divider(),
        )
      ],
    );
  }
}
