import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/Utilities/images.dart';
import 'package:flutter_application_14/core/models/products.dart';
import 'package:flutter_application_14/features/home_screen/widget/imageurlcontrol.dart'
    show ImageUrlControllerWidget;
import 'package:flutter_application_14/features/product_details/product_details.dart'
    show ProductDetails;

import '../../core/widgets/list_item_home.dart';

class HomeBage extends StatefulWidget {
  static const String routeName = 'homePage';

  const HomeBage({super.key});

  @override
  State<HomeBage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomeBage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _carouselSliderBuilder(),
            // Top Banner Section
            // SizedBox(
            //   height: 300,
            //   width: double.infinity,
            //   child: Stack(
            //     alignment: Alignment.bottomLeft,
            //     children: [
            //       Image.network(
            //         Appassets.topBannerHomebage,
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: 300,
            //       ),
            //       Opacity(
            //         opacity: 0.3,
            //         child: Container(
            //           height: 300,
            //           width: double.infinity,
            //           color: Colors.black,
            //         ),
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.all(18.0),
            //         child: Text(
            //           "Dresses",
            //           style: TextStyle(
            //             fontSize: 35,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 8),
            _builtHeaderofList(
              onTap: () {},
              context,
              title: "Sales",
              description: "Super sales",
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 240,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ListItemHome(
                        onPressed: () {
                          Navigator.pushNamed(context, ProductDetails.routeName);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 4)),
            _builtHeaderofList(
              onTap: () {},
              context,
              title: "NEW",
              description: "New Fashion",
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 240,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ListItemHome(
                        onPressed: () {
                          print("any thing");
                          Navigator.pushNamed(context, ProductDetails.routeName);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 4)),
          ],
        ),
      ),
    );
  }

  Widget _carouselSliderBuilder() {
    List<String> imageList = [
      //"assets/images/Pullover.jpeg",
      "assets/images/download (1).jpg",
      "assets/images/download.jpg",
      "assets/images/download (1).jpg",
      "assets/images/download (1).jpg"
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enlargeCenterPage: true,
          pageSnapping: true,
          padEnds: false,
          viewportFraction: 1,
          clipBehavior: Clip.none,
          height: 300,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          scrollDirection: Axis.horizontal,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            ImageUrlControllerWidget(
          width: double.infinity,
          height: double.infinity,
          imageUrl: imageList[itemIndex],
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _builtHeaderofList(
    BuildContext context, {
    required String title,
    required String description,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:
                        Colors.blue.withOpacity(0.1), // Add slight background
                  ),
                  child: const Text(
                    "View all",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
