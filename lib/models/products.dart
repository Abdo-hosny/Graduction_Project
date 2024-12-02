import 'package:flutter_application_14/Utilities/images.dart';

class Products {
  final String id;
  final String title;
  final String imageUrl;
  final String price;
  final int? discount;
  final String category;
  final double? rate;

  Products({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.discount,
    this.category = "other",
    this.rate,
  });

  /// Converts a Product object to a Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'discount': discount , 
      'category': category,
      'rate': rate 
    };
  }

  /// Converts a Map<String, dynamic> to a Product object
  factory Products.fromMap(Map<String, dynamic> map, String documentId) {
    return Products(
      id: documentId,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as String,
      discount: map['discount'] as int,
      category: map['category'] as String,
      rate: map['rate'] as double,
    );
  }
}

List<Products> dummyproducts = [
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0) //!
  ,
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0) //!
  ,
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0),
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0),
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0),
  Products(
      id: '1',
      title: "Dress",
      imageUrl: Appassets.tempProductImage1,
      price: "12",
      discount: 5,
      category: 'clothes',
      rate: 12.0),
];