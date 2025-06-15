import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/payment_screen/widget/row_deatils.dart';
import '../cart_screen/widgets/check_out_button.dart';
import '../payment_method/change_payment_method.dart';
import 'widget/row_delivery.dart';
import 'widget/row_payment.dart';
import 'widget/row_text_widget.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName="pay_ment";
  final int totalAmount;
  const PaymentScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping address"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextWidget(title: "Joen Deha", onTap: () {}),
                    Text("123 Main Street,\nAnytown, USA"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            RowTextWidget(
              title: "Payment",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePaymentMethod(),
                  ),
                );
              },
            ),
            RowPayment(),
            SizedBox(height: 20),
            Text("data"),
            SizedBox(height: 10),
            RowDelivery(),
            SizedBox(height: 50),
            RowDatils(txt: "order", totalAmount: totalAmount),
            SizedBox(height: 5),
            RowDatils(txt: "delivery", totalAmount: 15),
            SizedBox(height: 5),
            RowDatils(txt: "summary", totalAmount: totalAmount + 15),
            Spacer(),
            CheckoutButton(onPressed: () {}, txt: 'Submit Order'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
