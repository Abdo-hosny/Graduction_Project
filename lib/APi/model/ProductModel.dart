class ProductModel {
  final int id;
  final String name;
  final String color;
  final String description;
  final String price;
  final String brand;
  final String category;
  final String size;
  final String image;
  final List<dynamic> reviews;

  ProductModel({
    required this.id,
    required this.name,
    required this.color,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
    required this.size,
    required this.image,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      description: json['description'],
      price: json['price'],
      brand: json['brand'],
      category: json['category'],
      size: json['size'],
      image: "https://monsef74.pythonanywhere.com${json['image']}",
      reviews: json['reviews'] ?? [],
    );
  }
}
