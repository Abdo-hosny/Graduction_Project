// import 'package:flutter/material.dart';

// class WomensTopsScreen extends StatefulWidget {
//   static const String routeName = 'womenstops';

//   const WomensTopsScreen({super.key});

//   @override
//   State<WomensTopsScreen> createState() => _WomensTopsScreenState();
// }

// class _WomensTopsScreenState extends State<WomensTopsScreen> {
//   final List<String> categories = [
//     'All',
//     'T-shirts',
//     'Crop tops',
//     'Sleeveless',
//     'Hoodies',
//     'Blouses',
//     'Tunics',
//     'Tanks',
//   ];

//   String selectedCategory = 'All';

//   final List<Map<String, dynamic>> allProducts = [
//     {
//       'image': 'https://www.mytheresa.com/media/1094/1238/100/dc/P01013482.jpg',
//       'name': 'Pullover',
//       'brand': 'Mango',
//       'category': 'Hoodies',
//       'rating': 3,
//       'reviews': 3,
//       'price': 51,
//     },
//     {
//       'image': 'https://www.mytheresa.com/media/2310/2612/100/a8/P01032681.jpg',
//       'name': 'Blouse',
//       'brand': 'Dorothy Perkins',
//       'category': 'Blouses',
//       'rating': 0,
//       'reviews': 0,
//       'price': 34,
//     },
//     {
//       'image': 'https://example.com/tshirt.jpg',
//       'name': 'T-shirt',
//       'brand': 'LOST Ink',
//       'category': 'T-shirts',
//       'rating': 5,
//       'reviews': 10,
//       'price': 12,
//     },
//     {
//       'image': 'https://example.com/shirt.jpg',
//       'name': 'Shirt',
//       'brand': 'Topshop',
//       'category': 'Sleeveless',
//       'rating': 3,
//       'reviews': 3,
//       'price': 51,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final filteredProducts = selectedCategory == 'All'
//         ? allProducts
//         : allProducts.where((p) => p['category'] == selectedCategory).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Women's tops"),
//         actions: const [Icon(Icons.search)],
//         leading: const Icon(Icons.arrow_back),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),

//           // Categories list
//           SizedBox(
//             height: 40,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 final category = categories[index];
//                 final isSelected = category == selectedCategory;

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: ChoiceChip(
//                     label: Text(category),
//                     selected: isSelected,
//                     selectedColor: Colors.black,
//                     labelStyle: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black,
//                     ),
//                     onSelected: (_) {
//                       setState(() {
//                         selectedCategory = category;
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),

//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: const [
//                 Icon(Icons.filter_list),
//                 SizedBox(width: 5),
//                 Text('Filters'),
//                 Spacer(),
//                 Icon(Icons.swap_vert),
//                 SizedBox(width: 5),
//                 Text('Price: lowest to high'),
//                 Spacer(),
//                 Icon(Icons.grid_view),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Filtered product list
//           Expanded(
//             child: filteredProducts.isEmpty
//                 ? const Center(child: Text('No products found.'))
//                 : ListView.builder(
//                     itemCount: filteredProducts.length,
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];

//                       return ProductCard(product: product);
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;

//   const ProductCard({required this.product, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16),
//               bottomLeft: Radius.circular(16),
//             ),
//             child: Image.network(
//               product['image'],
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.image),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(product['name'],
//                       style: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.bold)),
//                   Text(product['brand'],
//                       style: const TextStyle(color: Colors.grey)),
//                   Row(
//                     children: List.generate(
//                       5,
//                       (i) => Icon(
//                         i < product['rating'] ? Icons.star : Icons.star_border,
//                         color: Colors.orange,
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                   Text('${product['price']}\$',
//                       style: const TextStyle(fontSize: 16)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../product_item.dart';
import 'dag_screen/widget/filter_Screen.dart';

class WomenProducts extends StatefulWidget {
  static const String routeName = 'womenProducts';
  const WomenProducts({super.key, required this.item,});
  final ProductItem item;
  @override
  State<WomenProducts> createState() => _WomenProductsState();
}

class _WomenProductsState extends State<WomenProducts> {
  String selectedSortOption = 'Price: lowest to high';
  String selectedCategory = "T-shirts";


  _WomenProductsState();
  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final options = [
          'Popular',
          'Newest',
          'Customer review',
          'Price: lowest to high',
          'Price: highest to low',
        ];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Sort by',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              ...options.map((option) => ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        color: selectedSortOption == option
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedSortOption = option;
                      });
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  List<ProductItem> _getProductsForCategory(String category) {
    switch (category) {
      case "T-shirts":
        return  [
          ProductItem(
            name: widget.item.name,
            brand: widget.item.brand,
            price: "${widget.item.price}\$",
            imagePath:widget.item.imagePath,
            rating:widget.item.rating,
            reviews: widget.item.reviews,
          ),
        ];
      case "Crop tops":
        return  [
          ProductItem(
            name: widget.item.name,
            brand: widget.item.brand,
            price: "${widget.item.price}\$",
            imagePath:widget.item.imagePath,
            rating:widget.item.rating,
            reviews: widget.item.reviews,
          ),
        ];
      case "Sleeveless":
        return  [
          ProductItem(
            name: widget.item.name,
            brand: widget.item.brand,
            price: "${widget.item.price}\$",
            imagePath:widget.item.imagePath,
            rating:widget.item.rating,
            reviews: widget.item.reviews,
          ),
        ];
      case "Blouses":
        return  [
          ProductItem(
            name: widget.item.name,
            brand: widget.item.brand,
            price: "${widget.item.price}\$",
            imagePath:widget.item.imagePath,
            rating:widget.item.rating,
            reviews: widget.item.reviews,
          ),
        ];
      default:
        return [];
    }
  }

  Widget _buildCategoryChip(String label) {
    final bool isSelected = selectedCategory == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = label;
          });
        },
        child: Chip(
          label: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: isSelected ? Colors.black : Colors.grey.shade200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Women’s tops",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildCategoryChip("T-shirts"),
                  _buildCategoryChip("Crop tops"),
                  _buildCategoryChip("Sleeveless"),
                  _buildCategoryChip("Blouses"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => FilterScreen()),
                        );
                      }),
                  const SizedBox(width: 5),
                  const Text("Filters"),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: _showSortOptions,
                    child: Row(
                      children: [
                        const Icon(Icons.swap_vert),
                        const SizedBox(width: 5),
                        Text(selectedSortOption),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.grid_view_rounded),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _getProductsForCategory(selectedCategory),
              ),
            )
          ],
        ),
      ),
    );
  }
}

