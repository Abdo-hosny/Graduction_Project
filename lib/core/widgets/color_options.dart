import 'package:flutter/material.dart';

class ColorOption extends StatelessWidget {
  final String color;
  final String selectedColor;
  final Function(String) onColorSelected;
  final void Function(void Function()) setModalState;

  const ColorOption(
    this.color,
    this.selectedColor,
    this.onColorSelected,
    this.setModalState, {
    super.key,
  });

  Color getColor(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Black':
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setModalState(() {
          onColorSelected(color);
          Navigator.pop(context);
        });
      },
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? getColor(color) : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          color,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? getColor(color) : Colors.black,
          ),
        ),
      ),
    );
  }
}
