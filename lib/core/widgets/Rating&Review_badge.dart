import 'package:flutter/material.dart';

class Rating_reviewBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatingReviewsScreen(),
    );
  }
}

class RatingReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating & Reviews"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "4.3",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_half,
                          color: Colors.orange,
                        );
                      }),
                    ),
                    const Text("23 ratings"),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            RatingBadge(),
            const SizedBox(height: 20),
            const Text("8 reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ReviewCard(
                    name: "Helene Moore",
                    date: "June 5, 2019",
                    rating: 4,
                    review:
                        "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. The underarms were not too wide and the dress was made well.",
                  ),
                  ReviewCard(
                    name: "Kate Doe",
                    date: "July 10, 2020",
                    rating: 5,
                    review:
                        "Absolutely love this dress! The fabric is amazing and fits perfectly. I highly recommend!",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) => WriteReviewModal(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Write a review",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        return Row(
          children: [
            Text("${5 - index} "),
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 5),
            Container(
              width: (15.0 * (5 - index)),
              height: 8,
              color: Colors.red,
            ),
          ],
        );
      }),
    );
  }
}

class WriteReviewModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("What is your rate?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5, (index) => const Icon(Icons.star_border, size: 30)),
          ),
          const SizedBox(height: 20),
          const Text("Please share your opinion about the product"),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Your review"),
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.red),
            onPressed: () {},
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("SEND REVIEW",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final int rating;
  final String review;

  ReviewCard(
      {required this.name,
      required this.date,
      required this.rating,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(date, style: TextStyle(color: Colors.grey)),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                );
              }),
            ),
            SizedBox(height: 5),
            Text(review),
          ],
        ),
      ),
    );
  }
}
