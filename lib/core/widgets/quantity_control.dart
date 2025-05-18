// lib/widgets/quantity_control.dart

import 'package:flutter/material.dart';

class QuantityControl extends StatelessWidget {
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int quantity;

  const QuantityControl({
    Key? key,
    required this.onIncrease,
    required this.onDecrease,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onDecrease,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.remove, size: 16, color: Colors.black),
          ),
        ),
        const SizedBox(width: 12),
        Text('$quantity', style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 12),
        InkWell(
          onTap: onIncrease,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.add, size: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
