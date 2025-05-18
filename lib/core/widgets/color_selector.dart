import 'package:flutter/material.dart';

import 'color_options.dart';

void showColorSelector(
  BuildContext context,
  String selectedColor,
  Function(String) onColorSelected,
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
            height: 300,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Select Color",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ColorOption(
                      'Black',
                      selectedColor,
                      onColorSelected,
                      setModalState,
                    ),
                    const SizedBox(width: 15),
                    ColorOption(
                      'Red',
                      selectedColor,
                      onColorSelected,
                      setModalState,
                    ),
                    const SizedBox(width: 15),
                    ColorOption(
                      'Green',
                      selectedColor,
                      onColorSelected,
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
                      style: TextStyle(fontSize: 18),
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
