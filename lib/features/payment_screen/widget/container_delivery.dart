import 'package:flutter/material.dart';

class ContainerDelivery extends StatelessWidget {
  final String img;
  const ContainerDelivery({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(width: 50, height: 50, image: AssetImage(img)),
          SizedBox(height: 10),
          Text("2-3 days"),
        ],
      ),
    );
  }
}
