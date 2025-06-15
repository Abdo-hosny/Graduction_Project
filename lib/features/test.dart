import 'package:flutter/material.dart';
import '../APi/manger/api_anager.dart';
import '../APi/model/AllProducts.dart';
import 'home_screen/product_details.dart';
import 'home_screen/widget/list_item_sale.dart';

class Test extends StatelessWidget {
  static String routeName ="c";
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<ProductResponse>(
              future: ApiManager.searchPlace(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('An error occurred: ${snapshot.error}'));
                }
        
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Men', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    buildCategorySection("Men", snapshot),
        
                    const SizedBox(height: 20),
                    const Text('Women', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    buildCategorySection("Women", snapshot),
        
                    const SizedBox(height: 20),
                    const Text('Kids', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    buildCategorySection("Kids", snapshot),
                  ],
                );
              },
            )
        
          ],
        ),
      ),
    );
  }
  Widget buildCategorySection(String category, AsyncSnapshot<ProductResponse> snapshot) {
    final products = (snapshot.data?.products ?? [])
        .where((product) => product.category == category)
        .toList();

    if (products.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final item = products[index];

          return ListItemSales(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetails(product: item),
                ),
              );

            },
            imageUrl: item.image ?? '',
            type: item.brand ?? '',
            name: item.name ?? '',
            price: item.price ?? '',
          );
        },
      ),
    );
  }

}


class CategoryProductsScreen extends StatelessWidget {
  final String category;

  const CategoryProductsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Products')),
      body: FutureBuilder<ProductResponse>(
        future: ApiManager.searchPlace(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          }

          return buildCategorySection(category, snapshot);
        },
      ),
    );
  }
}

Widget buildCategorySection(String category, AsyncSnapshot<ProductResponse> snapshot) {
  final products = (snapshot.data?.products ?? [])
      .where((product) => product.category == category)
      .toList();

  if (products.isEmpty) {
    return const Center(child: Text('No products in this category'));
  }

  return SizedBox(
    height: 280,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        final item = products[index];

        return ListItemSales(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetails(product: item),
              ),
            );
            if (result == 'added') {
              // SnackBar or update logic
            }
          },
          imageUrl: item.image ?? '',
          type: item.brand ?? '',
          name: item.name ?? '',
          price: item.price ?? '',
        );
      },
    ),
  );
}

