import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String txt;
  final void Function() onPress;
  const CustomButton({
    super.key,
    required this.width,
    required this.txt,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      minWidth: width * 0.9,
      color: Colors.red,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(txt, style: const TextStyle(color: Colors.black)),
    );
  }
}
