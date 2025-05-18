import 'package:flutter/material.dart';

import 'container_delivery.dart' show ContainerDelivery;

class RowDelivery extends StatelessWidget {
  const RowDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 3; i++)
          Expanded(child: ContainerDelivery(img: "assets/images/fedEx.jpeg")),
      ],
    );
  }
}
