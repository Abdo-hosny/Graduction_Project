import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/payment_method/widgets/build_custom_text_field.dart';

class ChangePaymentMethod extends StatefulWidget {
  const ChangePaymentMethod({super.key});

  @override
  State<ChangePaymentMethod> createState() => _ChangePaymentMethodState();
}

class _ChangePaymentMethodState extends State<ChangePaymentMethod> {
  int? selectedCardIndex; // 0 for first card, 1 for second card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Your Payment Cards",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // First Card
              Image(
                image: AssetImage(
                  "assests/images/Screenshot 2025-04-28 192116.png",
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Radio<int>(
                    activeColor: Colors.black,
                    value: 0,
                    groupValue: selectedCardIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedCardIndex = value;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text("Use as default payment method"),
                ],
              ),

              const SizedBox(height: 10),

              // Second Card
              Image(
                image: AssetImage(
                  "assests/images/Screenshot 2025-04-28 192116.png",
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Radio<int>(
                    activeColor: Colors.black,
                    value: 1,
                    groupValue: selectedCardIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedCardIndex = value;
                      });
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text("Use as default payment method"),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(150)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              TextEditingController cardHolderController =
                  TextEditingController();
              TextEditingController cardNumberController =
                  TextEditingController();
              TextEditingController expiryDateController =
                  TextEditingController();
              TextEditingController cvvController = TextEditingController();
              bool setAsDefault = false;
              return StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 16,
                      right: 16,
                      top: 24,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Center(
                            child: Text(
                              "Add New Card",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // 4 TextFields
                          buildCustomTextField(
                            controller: cardHolderController,
                            label: "Card Holder Name",
                          ),
                          SizedBox(height: 16),
                          buildCustomTextField(
                            controller: cardNumberController,
                            label: "Card Number",
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16),
                          buildCustomTextField(
                            controller: expiryDateController,
                            label: "Expiry Date",
                            hintText: "MM/YY",
                            keyboardType: TextInputType.datetime,
                          ),
                          SizedBox(height: 16),
                          buildCustomTextField(
                            controller: cvvController,
                            label: "CVV",
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          ),
                          SizedBox(height: 16),

                          // Checkbox Row
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.black,
                                value: setAsDefault,
                                onChanged: (bool? value) {
                                  setState(() {
                                    setAsDefault = value ?? false;
                                  });
                                },
                              ),
                              SizedBox(width: 8),
                              Text("Set as default payment method"),
                            ],
                          ),
                          SizedBox(height: 20),

                          // Add Card Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the sheet
                                // Here you can add the logic to add the card
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text(
                                "Add Card",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }
}
