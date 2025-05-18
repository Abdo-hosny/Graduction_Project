// lib/widgets/cart_list.dart

import 'package:flutter/material.dart';
import '../../../core/models/cart-item.dart';
import 'cart_item_card.dart';

class CartList extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(int) onIncrease;
  final Function(int) onDecrease;

  const CartList({
    super.key,
    required this.cartItems,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return CartItemCard(
          item: item,
          onIncrease: () => onIncrease(index),
          onDecrease: () => onDecrease(index),
        );
      },
    );
  }
}
