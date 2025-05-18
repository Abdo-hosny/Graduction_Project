import 'package:flutter/material.dart';

class RowDatils extends StatelessWidget {
  final String txt;
  final int totalAmount;
  const RowDatils({super.key, required this.txt, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(txt), Spacer(), Text("${totalAmount} \$")]);
  }
}
