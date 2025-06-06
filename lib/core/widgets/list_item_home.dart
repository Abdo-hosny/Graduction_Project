import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/models/products.dart';

import '../../features/product_details/product_details.dart';

class ListItemHome extends StatelessWidget {
  final Products products;
  const ListItemHome({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(),
          ),
        ),
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
                        products.imageUrl,
                        height: 150,
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                      width: 45,
                      height: 35,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '${products.discount}%',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                products.category,
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                products.title,
                style: TextStyle(color: Colors.black),
              ),
              Text('${products.price}\$', style: TextStyle(color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}
