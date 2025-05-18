import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  bool showPromoCodes = false;

  void togglePromoCodes() {
    setState(() {
      showPromoCodes = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your promo code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: togglePromoCodes,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (showPromoCodes) ...[
              const Text(
                'Your Promo Codes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    PromoCodeCard(
                      discount: '10%',
                      title: 'Personal offer',
                      code: 'mypromocode2020',
                      daysRemaining: '6 days remaining',
                    ),
                    PromoCodeCard(
                      discount: '15%',
                      title: 'Summer Sale',
                      code: 'summer2020',
                      daysRemaining: '23 days remaining',
                    ),
                    PromoCodeCard(
                      discount: '22%',
                      title: 'Personal offer',
                      code: 'mypromocode2020',
                      daysRemaining: '6 days remaining',
                    ),
                  ],
                ),
              ),
            ] else ...[
              Expanded(child: Container()),
            ]
          ],
        ),
      ),
    );
  }
}

class PromoCodeCard extends StatelessWidget {
  final String discount;
  final String title;
  final String code;
  final String daysRemaining;

  const PromoCodeCard({
    super.key,
    required this.discount,
    required this.title,
    required this.code,
    required this.daysRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$discount off',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(height: 5),
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(code, style: const TextStyle(color: Colors.grey)),
                Text(daysRemaining, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Apply', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
