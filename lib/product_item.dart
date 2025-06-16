import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name, brand, price, imagePath;
  final int rating, reviews;

  const ProductItem({
    super.key,
    required this.name,
    required this.brand,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              imagePath,
              width: 110,
              height: 110,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(brand, style: TextStyle(color: Colors.grey.shade600)),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                              (index) => Icon(
                            Icons.star,
                            size: 16,
                            color: index < rating
                                ? Colors.amber
                                : Colors.grey.shade300,
                          )),
                      const SizedBox(width: 4),
                      Text("($reviews)", style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  Text(price,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
