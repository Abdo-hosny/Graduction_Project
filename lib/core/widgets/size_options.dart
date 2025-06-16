import 'package:flutter/material.dart';

class SizeOption extends StatelessWidget {
  final String size;
  final String? selectedSize;
  final Function(String) onSizeSelected;
  final void Function(void Function()) setModalState;

  const SizeOption(
    this.size,
    this.selectedSize,
    this.onSizeSelected,
    this.setModalState, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        setModalState(() {
          onSizeSelected(size);
          Navigator.pop(context);
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.red : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
