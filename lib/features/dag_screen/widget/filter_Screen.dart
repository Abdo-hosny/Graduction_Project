import 'package:flutter/material.dart';

class Brand {
  String name;
  bool isSelected;

  Brand(this.name, this.isSelected);
}

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
  List<String> selectedBrands = [];

  final List<Brand> brands = [
    Brand("adidas", false),
    Brand("Zara", false),
    Brand("H&M", false),
    Brand("Blend", false),
    Brand("Boutique Moschino", false),
    Brand("Champion", false),
    Brand("Diesel", false),
    Brand("Jack & Jones", false),
    Brand("Naf Naf", false),
    Brand("Red Valentino", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('Filters', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
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
                Wrap(
                  spacing: 10,
                  children: sizeOptions.map((size) {
                    final bool isSelected = size == selectedSize;
                    return ChoiceChip(
                      label: Text(size),
                      selected: isSelected,
                      selectedColor: Colors.red,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
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
                Wrap(
                  spacing: 10,
                  children: categoryOptions.map((category) {
                    final bool isSelected = category == selectedCategory;
                    return ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: Colors.red,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Brand'),
                const SizedBox(height: 10),
                ...brands.map((brand) {
                  return CheckboxListTile(
                    title: Text(
                      brand.name,
                      style: TextStyle(
                        color: brand.isSelected ? Colors.red : Colors.black,
                        fontWeight: brand.isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    value: brand.isSelected,
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        brand.isSelected = value!;
                        updateSelectedBrands();
                      });
                    },
                  );
                }).toList(),
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
                    child: const Text('Discard', style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppliedFilterResultScreen(
                            minPrice: _minPrice,
                            maxPrice: _maxPrice,
                            selectedColor: selectedColor,
                            selectedSize: selectedSize,
                            selectedCategory: selectedCategory,
                            selectedBrands: selectedBrands,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Apply', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateSelectedBrands() {
    selectedBrands = brands.where((b) => b.isSelected).map((e) => e.name).toList();
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
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

class AppliedFilterResultScreen extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final Color? selectedColor;
  final String? selectedSize;
  final String? selectedCategory;
  final List<String> selectedBrands;

  const AppliedFilterResultScreen({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    this.selectedColor,
    this.selectedSize,
    this.selectedCategory,
    required this.selectedBrands,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applied Filters'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("💰 Price Range: \$${minPrice.round()} - \$${maxPrice.round()}"),
            const SizedBox(height: 10),
            Text("🎨 Selected Color: ${selectedColor != null ? selectedColor.toString() : 'None'}"),
            const SizedBox(height: 10),
            Text("📏 Selected Size: ${selectedSize ?? 'None'}"),
            const SizedBox(height: 10),
            Text("🧭 Category: ${selectedCategory ?? 'None'}"),
            const SizedBox(height: 10),
            Text("🏷️ Brands: ${selectedBrands.isNotEmpty ? selectedBrands.join(', ') : 'None'}"),
          ],
        ),
      ),
    );
  }
}
