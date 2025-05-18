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

import 'filter_Screen.dart';

class WomenProducts extends StatefulWidget {
  static const String routeName = 'womenProducts';
  const WomenProducts({super.key});

  @override
  State<WomenProducts> createState() => _WomenProductsState();
}

class _WomenProductsState extends State<WomenProducts> {
  String selectedSortOption = 'Price: lowest to high';
  String selectedCategory = "T-shirts";

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
        return const [
          ProductItem(
            name: "T-shirt",
            brand: "LOST Ink",
            price: "12\$",
            imagePath:
                "https://www.fairindigo.com/cdn/shop/files/BG_OF_04750_Tomato_Cream_SS25_0981.jpg?v=1741368255&width=600",
            rating: 5,
            reviews: 10,
          ),
        ];
      case "Crop tops":
        return const [
          ProductItem(
            name: "Crop Top",
            brand: "Zara",
            price: "25\$",
            imagePath:
                "https://images.unsplash.com/photo-1503342394128-c104d54dba01?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y3JvcCUyMHRvcHxlbnwwfHwwfHx8MA%3D%3D",
            rating: 4,
            reviews: 5,
          ),
        ];
      case "Sleeveless":
        return const [
          ProductItem(
            name: "Sleeveless Top",
            brand: "H&M",
            price: "18\$",
            imagePath:
                "https://carinawear.com/cdn/shop/products/cotton-sleeveless-tank-top-carina--1-31107360358640.jpg?v=1713446840",
            rating: 3,
            reviews: 2,
          ),
        ];
      case "Blouses":
        return const [
          ProductItem(
            name: "Blouse",
            brand: "Dorothy Perkins",
            price: "34\$",
            imagePath:
                "https://images.unsplash.com/photo-1595828204607-0d09afb58a71?w=500&auto=format&fit=crop&q=60",
            rating: 0,
            reviews: 0,
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back),
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                ],
              ),
            ),
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
