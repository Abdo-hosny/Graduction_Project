import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  MaterialButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.colorText,
    this.colorBackground,
    this.fontWeight,
    this.haveBorder = false,
    this.radius,
  });

  final Widget title; // تغيير هنا من String إلى Widget
  final void Function()? onPressed;
  final Color? colorText;
  final Color? colorBackground;
  final FontWeight? fontWeight;
  final double? radius;
  bool haveBorder = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15),
        side: BorderSide(
          color: haveBorder ? Colors.red : Colors.transparent,
          width: 2,
        ),
      ),
      onPressed: onPressed,
      color: colorBackground ?? Colors.red,
      child: DefaultTextStyle(
        style:TextStyle(
          fontSize: 18,// medium
          color: colorText ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),  child: title,
      ),
    );
  }
}