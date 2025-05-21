import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/Utilities/images.dart' show Appassets;

class ListItemHome extends StatelessWidget {
  final void Function()? onPressed;

  const ListItemHome({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Material( // ✅ ضروري لتفعيل InkWell
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.0), // اختياري، لتأثير الضغط
          child: DecoratedBox(
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        Appassets.tempProductImage1,
                        height: 150,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned( // ✅ تحسين مكان الخصم
                      top: 8,
                      left: 8,
                      child: Container(
                        width: 45,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.red,
                        ),
                        child: const Center(
                          child: Text(
                            '5%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'clothes',
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  "Dress",
                  style: TextStyle(color: Colors.black),
                ),
                const Text(
                  '12\$',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}