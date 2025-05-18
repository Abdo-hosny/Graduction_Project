import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/widgets/size_options.dart';

void showSizeSelector(
  BuildContext context,
  String? selectedSize,
  Function(String) onSizeSelected,
) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: 400,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Select Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    SizeOption(
                      'XS',
                      selectedSize,
                      onSizeSelected,
                      setModalState,
                    ),
                    const SizedBox(width: 15),
                    SizeOption(
                      'S',
                      selectedSize,
                      onSizeSelected,
                      setModalState,
                    ),
                    const SizedBox(width: 15),
                    SizeOption(
                      'M',
                      selectedSize,
                      onSizeSelected,
                      setModalState,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizeOption(
                      'L',
                      selectedSize,
                      onSizeSelected,
                      setModalState,
                    ),
                    const SizedBox(width: 15),
                    SizeOption(
                      'XL',
                      selectedSize,
                      onSizeSelected,
                      setModalState,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
