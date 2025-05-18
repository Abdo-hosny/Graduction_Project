import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/product_details/views/review_and_rating.dart';
import '../../core/widgets/color_selector.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/select_sector.dart';
import '../cart_screen/cart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize;
  String selectedColor = 'Black';
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    selectedSize = null;
    selectedColor = 'Black';
  }

  void _selectSize() {
    showSizeSelector(context, selectedSize, (newSize) {
      setState(() {
        selectedSize = newSize;
      });
    });
  }

  void _selectColor() {
    showColorSelector(context, selectedColor, (newColor) {
      setState(() {
        selectedColor = newColor;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details Screen'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: PageView(
              children: [
                Image.asset(
                  'assets/images/short dress black.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/short_dress_black1.jpeg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _selectSize,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(selectedSize ?? 'Select Size'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: _selectColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(selectedColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Text(
                        'H&M',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$19.99',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Short black dress',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
                    style: TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    title: Text("Item Details"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewAndRating(),
                        ),
                      );
                    },
                    trailing: Icon(Icons.arrow_right),
                  ),
                  const Spacer(),
                  CustomButton(
                    width: double.infinity,
                    txt: "Add To Cart",
                    onPress: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyBagScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
