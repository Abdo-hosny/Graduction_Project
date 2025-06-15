import 'package:flutter/cupertino.dart';
import '../core/models/cart-item.dart';
class ProviderScreen extends ChangeNotifier{
  final List<CartItem> cartItems = [];
  void addItem(CartItem item){
    cartItems.add(item);
    notifyListeners();
  }
  void cardItem(){

  }
}