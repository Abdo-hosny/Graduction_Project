import 'package:flutter/material.dart';

class ReviewAndRating extends StatefulWidget {
  const ReviewAndRating({super.key});

  @override
  State<ReviewAndRating> createState() => _ReviewAndRatingState();
}

class _ReviewAndRatingState extends State<ReviewAndRating> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review & Rating',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4.3',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '23 Ratings',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i <= 4; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0; i <= 3; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0; i <= 2; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0; i <= 1; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              for (int i = 0; i <= 0; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 5,
                            children: [
                              Container(
                                height: 8,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Text('12')
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Container(
                                height: 8,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Text('5')
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Container(
                                height: 8,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Text('4')
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Container(
                                height: 8,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Text('2')
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Container(
                                height: 8,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              const Text('0')
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '8 Reviews',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checked,
                        onChanged: (value) {
                          setState(() {
                            checked = value!;
                          });
                        },
                      ),
                      const Text('With Photo'),
                    ],
                  ),
                ],
              ),
              for (int i = 0; i <= 2; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/short_dress_black1.jpeg"),
                        ),
                        title: const Text("Helene Moore"),
                        subtitle: Row(
                          children: [
                            for (int i = 0; i <= 3; i++)
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                            const Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ],
                        ),
                        trailing: const Text("June 5, 2019"),
                      ),
                      const Text(
                        "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B Chest. This dress would be too long for those who are showrter but could be hemmed. I wouldn't recommend if dor those big chested",
                        style: TextStyle(fontSize: 18, letterSpacing: 2),
                      ),
                      const Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Helpful"),
                          Icon(Icons.handshake_outlined)
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: 250,
                child: const Center(
                  child: Text(
                    'This is a bottom sheet',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          width: 180,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.red,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Write a review',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
