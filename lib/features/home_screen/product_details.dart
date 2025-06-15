import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/home_screen/review_and_rating.dart';
import 'package:provider/provider.dart';
import '../../APi/const/api_constants.dart';
import '../../APi/model/AllProducts.dart';
import '../../core/models/cart-item.dart';
import '../../core/widgets/color_selector.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/select_sector.dart';
import '../../provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = "ProductDetails";
    final Product product;
  ProductDetails({super.key ,required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String? selectedSize;
  String selectedColor = 'Black';

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
    var provider = Provider.of<ProviderScreen>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Details Screen'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                ApiConstants.getFullImageUrl(widget.product.image ?? ""),
                width: double.infinity,
                fit: BoxFit.fill,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _selectSize,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(selectedColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'H&M',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          widget.product.price ?? '',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.product.name ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.size ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        int.tryParse('${widget.product.reviews}') ?? 3,
                            (index) => const Icon(Icons.star, color: Colors.amber, size: 20),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.product.description ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                    ListTile(
                      title: const Text(
                        "Item Details",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReviewAndRating(),
                          ),
                        );
                      },
                      trailing: const Icon(Icons.arrow_right, color: Colors.blue, size: 30),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      width: double.infinity,
                      txt: "Add To Cart",
                      onPress: () {
                        final cartItem = CartItem(
                          //ApiConstants.getFullImageUrl(widget.product.image ?? "assets/images/shimmer2.jpg")
                          image: widget.product.image ??'',
                          title: widget.product.name ?? '',
                          color: selectedColor,
                          size: selectedSize ?? '',
                          price: (widget.product.price ?? 0).toString(),
                          quantity: 1,
                        );
                        provider.addItem(cartItem);
                        Navigator.pop(context, cartItem); // ترجع العنصر المحدد
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
