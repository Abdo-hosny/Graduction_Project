class CartItem {
  final String image;
  final String title;
  final String color;
  final String size;
  final String price; // String type
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
  });

  // Helper method to calculate item total
  int get itemTotal {
    final parsedPrice = int.tryParse(price);
    if (parsedPrice != null) {
      return parsedPrice * quantity;
    }
    return 0;
  }
}
