// /// products : [{"id":1,"reviews":[],"name":"T-Shirt Polo","description":"White","price":"500.00","brand":"Nike","category":"Men","size":"XL","image":"/media/product_images/1.jpg","created_at":"2024-11-13T00:52:43.358413Z","user":1},{"id":2,"reviews":[{"id":1,"rating":4,"comment":"Good","created_at":"2025-03-03T14:48:50.629753Z","product":2,"user":3}],"name":"T-Shirt Polo","description":"Blue","price":"510.00","brand":"Nike","category":"Men","size":"XL","image":"/media/product_images/2.jpg","created_at":"2024-11-13T00:53:31.155893Z","user":1}]
// /// per page : 2
// /// count : 60
//
// class AllProducts {
//   AllProducts({
//       this.products,
//       this.perpage,
//       this.count,});
//
//   AllProducts.fromJson(dynamic json) {
//     if (json['products'] != null) {
//       products = [];
//       json['products'].forEach((v) {
//         products?.add(Products.fromJson(v));
//       });
//     }
//     perpage = json['per page'];
//     count = json['count'];
//   }
//   List<Products>? products;
//   int? perpage;
//   int? count;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (products != null) {
//       map['products'] = products?.map((v) => v.toJson()).toList();
//     }
//     map['per page'] = perpage;
//     map['count'] = count;
//     return map;
//   }
//
// }
//
// /// id : 1
// /// reviews : []
// /// name : "T-Shirt Polo"
// /// description : "White"
// /// price : "500.00"
// /// brand : "Nike"
// /// category : "Men"
// /// size : "XL"
// /// image : "/media/product_images/1.jpg"
// /// created_at : "2024-11-13T00:52:43.358413Z"
// /// user : 1
//
// class Products {
//   Products({
//       this.id,
//       this.reviews,
//       this.name,
//       this.description,
//       this.price,
//       this.brand,
//       this.category,
//       this.size,
//       this.image,
//       this.createdAt,
//       this.user,});
//
//   Products.fromJson(dynamic json) {
//     id = json['id'];
//     if (json['reviews'] != null) {
//       reviews = [];
//       json['reviews'].forEach((v) {
//         reviews?.add(Dynamic.fromJson(v));
//       });
//     }
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     brand = json['brand'];
//     category = json['category'];
//     size = json['size'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     user = json['user'];
//   }
//   int? id;
//   List<dynamic>? reviews;
//   String? name;
//   String? description;
//   String? price;
//   String? brand;
//   String? category;
//   String? size;
//   String? image;
//   String? createdAt;
//   int? user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     if (reviews != null) {
//       map['reviews'] = reviews?.map((v) => v.toJson()).toList();
//     }
//     map['name'] = name;
//     map['description'] = description;
//     map['price'] = price;
//     map['brand'] = brand;
//     map['category'] = category;
//     map['size'] = size;
//     map['image'] = image;
//     map['created_at'] = createdAt;
//     map['user'] = user;
//     return map;
//   }
//
// }

class ProductResponse {
   List<Product>? products;
   int? perPage;
   int? count;

  ProductResponse({
    required this.products,
    required this.perPage,
    required this.count,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
      perPage: json['per page'],
      count: json['count'],
    );
  }
}

class Product {
   int? id;
   List<Review>? reviews;
   String? name;
   String? color;
   String? description;
   String? price;
   String? brand;
   String? category;
   String? size;
   String? image;
   String? createdAt;
   int? user;

  Product({
    this.id,
     this.reviews,
     this.name,
     this.description,
     this.price,
    this.color,
     this.brand,
     this.category,
     this.size,
     this.image,
     this.createdAt,
     this.user,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      reviews: List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))),
      name: json['name'],
      description: json['description'],
      price: json['price'],
      color: json['color'],
      brand: json['brand'],
      category: json['category'],
      size: json['size'],
      image: json['image'],
      createdAt: json['created_at'],
      user: json['user'],
    );
  }
}

class Review {
   int? id;
   int? rating;
   String? comment;
   String? createdAt;
   int? product;
   int? user;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.product,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: json['created_at'],
      product: json['product'],
      user: json['user'],
    );
  }
}
