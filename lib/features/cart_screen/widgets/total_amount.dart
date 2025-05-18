import 'package:flutter/material.dart';

class TotalAmountRow extends StatelessWidget {
  final int totalAmount;

  const TotalAmountRow({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total amount:', style: TextStyle(fontSize: 16)),
        Text(
          '\$$totalAmount',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
