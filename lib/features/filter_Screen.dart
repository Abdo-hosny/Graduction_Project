// import 'package:flutter/material.dart';

// class Brand {
//   String name;
//   bool isSelected;

//   Brand(this.name, this.isSelected);
// }

// class BrandFilterScreen extends StatefulWidget {
//   @override
//   _BrandFilterScreenState createState() => _BrandFilterScreenState();
// }

// class _BrandFilterScreenState extends State<BrandFilterScreen> {
//   List<Brand> brands = [
//     Brand("adidas", false),
//     Brand("Zara", false),
//     Brand("H&M", false),
//     Brand("Blend", false),
//     Brand("Boutique Moschino", false),
//     Brand("Champion", false),
//     Brand("Diesel", false),
//     Brand("Jack & Jones", false),
//     Brand("Naf Naf", false),
//     Brand("Red Valentino", false),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Brand"),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(35),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: brands.length,
//                 itemBuilder: (context, index) {
//                   return CheckboxListTile(
//                     title: Text(
//                       brands[index].name,
//                       style: TextStyle(
//                         color: brands[index].isSelected
//                             ? Colors.red
//                             : Colors.black,
//                         fontWeight: brands[index].isSelected
//                             ? FontWeight.bold
//                             : FontWeight.normal,
//                       ),
//                     ),
//                     value: brands[index].isSelected,
//                     activeColor: Colors.red,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         brands[index].isSelected = value!;
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         Navigator.pop(context);

//                       },
//                       child: Text("Discard", style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Apply logic here
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                       child: Text("Apply", style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         );
//   }
// }

import 'package:flutter/material.dart';
import 'Brand_Screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _minPrice = 78;
  double _maxPrice = 143;
  final List<Color> colorOptions = [
    Colors.black,
    const Color(0xffFFFFFF),
    Colors.red,
    const Color(0xFFD8CFCB),
    const Color(0xFFF6E0CE),
    Colors.indigo,
  ];

  final List<String> sizeOptions = ['XS', 'S', 'M', 'L', 'XL'];
  final List<String> categoryOptions = ['All', 'Women', 'Men', 'Boys', 'Girls'];

  Color? selectedColor;
  String? selectedSize = 'S';
  String? selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Filters',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionTitle('Price range'),
                const SizedBox(height: 8),
                RangeSlider(
                  activeColor: Colors.red,
                  values: RangeValues(_minPrice, _maxPrice),
                  min: 15,
                  max: 200,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _minPrice = values.start;
                      _maxPrice = values.end;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${_minPrice.round()}'),
                    Text('\$${_maxPrice.round()}'),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Colors'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colorOptions.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: buildColorOption(color, selectedColor == color),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Sizes'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: sizeOptions.map((size) {
                    final bool isSelected = size == selectedSize;
                    return ChoiceChip(
                      label: Text(size),
                      selected: isSelected,
                      selectedColor: Colors.red,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Category'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: categoryOptions.map((category) {
                    final bool isSelected = category == selectedCategory;
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: Colors.red,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Brand',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'adidas Originals, Jack & Jones, s.Oliver',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrandFilterScreen()));
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget buildColorOption(Color color, bool isSelected) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isSelected ? Border.all(color: Colors.red, width: 2) : null,
      ),
    );
  }
}
