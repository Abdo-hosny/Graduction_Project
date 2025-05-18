import 'package:flutter/material.dart';
import '../../../core/models/cart-item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleRow(),
                  const SizedBox(height: 4),
                  _buildColorSizeText(),
                  const SizedBox(height: 12),
                  _buildQuantityControls(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        item.image,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildColorSizeText() {
    return Text(
      'Color: ${item.color}   Size: ${item.size}',
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        _buildQuantityButton(Icons.remove, onDecrease),
        const SizedBox(width: 12),
        Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 12),
        _buildQuantityButton(Icons.add, onIncrease),
        const Spacer(),
        Text(
          '\$${item.itemTotal}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.grey.shade300,
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }
}
