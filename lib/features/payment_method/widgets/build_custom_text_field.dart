import 'package:flutter/material.dart';

Widget buildCustomTextField({
  required TextEditingController controller,
  required String label,
  TextInputType? keyboardType,
  bool obscureText = false,
  String? hintText,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
      ],
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
