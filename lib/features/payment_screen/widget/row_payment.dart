import 'package:flutter/material.dart';

class RowPayment extends StatelessWidget {
  const RowPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(width: 50, image: AssetImage("assets/images/Master_card.jpeg")),
        SizedBox(width: 10),
        Text("**** **** **** 3974"),
      ],
    );
  }
}
