import 'package:flutter_application_14/Utilities/images.dart';

class Products {
  final String id;
  final String title;
  final String imageUrl;
  final String price;
  final int? discount;
  final String category;
  final double? rate;
  Products(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price,
      this.discount,
      this.category = "other",
      this.rate});
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
