import 'package:flutter_application_14/auth/services/firestore_services.dart';
import 'package:flutter_application_14/models/products.dart';

abstract class Database {
  Stream<List<Products>> productsStream();
}

class FirestoreDataBase implements Database {
  final _service = FirestoreServices.instance;
  @override
  Stream<List<Products>> productsStream() => _service.collectionStreams(
      path: 'Products/',
      builder: (data, documentId) => Products.fromMap(data!, documentId));
}
