class CartItem {
  final String image;
  final String title;
  final String color;
  final String size;
  final int price;
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
  int get itemTotal => price * quantity;
}
