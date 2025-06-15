import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/cart_screen/widgets/appbar_widget_bag.dart';
import 'package:flutter_application_14/features/cart_screen/widgets/check_out_button.dart';
import 'package:flutter_application_14/features/cart_screen/widgets/poromo_code.dart';
import 'package:flutter_application_14/features/cart_screen/widgets/total_amount.dart';
import 'package:provider/provider.dart';
import '../../core/models/cart-item.dart';
import '../../provider/provider.dart';
import '../payment_screen/payment_screen.dart';
import 'widgets/cart_item_card.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  final List<CartItem> cartItems = [];

  int get totalAmount => cartItems.fold(0, (sum, item) => sum + item.itemTotal);

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderScreen>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.cartItems.length,
                itemBuilder: (context, index) => CartItemCard(
                  item: provider.cartItems[index],
                  onIncrease: () => increaseQuantity(index),
                  onDecrease: () => decreaseQuantity(index),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const PromoCodeField(),
            const SizedBox(height: 16),
            TotalAmountRow(totalAmount: totalAmount),
            const SizedBox(height: 20),
            CheckoutButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentScreen(totalAmount: totalAmount),
                  ),
                );
              },
              txt: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
