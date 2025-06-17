import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/chatbot/chat_bot.dart';
import 'package:flutter_application_14/features/home_screen/widget/imageurlcontrol.dart'
    show ImageUrlControllerWidget;
import 'package:flutter_application_14/features/home_screen/widget/list_item_new.dart';
import 'package:flutter_application_14/features/home_screen/product_details.dart'
    show ProductDetails;
import 'package:skeletonizer/skeletonizer.dart';

import '../../APi/manger/api_anager.dart';
import '../../APi/model/AllProducts.dart';
import '../../APi/model/ProductModel.dart';
import '../share_pre.dart';
import '../test.dart';
import 'widget/list_item_sale.dart';

class HomeBage extends StatefulWidget {
  static const String routeName = 'homePage';

  const HomeBage({super.key});

  @override
  State<HomeBage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomeBage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
               Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person,size: 30,),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( SharedPrefsService.getString("name")??"name",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          SharedPrefsService.getString("email")??"email",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
  Spacer(),
  CircleAvatar(
    child: IconButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ChatBotScreen();
    }));
  }, icon: Icon(Icons.mark_chat_unread_outlined)),)
                ],
              ),
              const SizedBox(height: 30,),
              _carouselSliderBuilder(),
              const SizedBox(height: 8),
              FutureBuilder<ProductResponse>(
                future: ApiManager.searchPlace(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('An error occurred: ${snapshot.error}'));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Men', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      buildCategorySection("Men", snapshot),

                      const SizedBox(height: 20),
                      const Text('Women', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      buildCategorySection("Women", snapshot),

                      const SizedBox(height: 20),
                      const Text('Kids', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      buildCategorySection("Kids", snapshot),
                    ],
                  );
                },
              ),
              const Text('Sales',
                textAlign: TextAlign.start,
                style: TextStyle( fontSize: 22,
                    fontWeight: FontWeight.bold,color: Colors.blue),),
              const SizedBox(height: 8),


              FutureBuilder<ProductResponse>(
                future: ApiManager.searchPlace(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Skeletonizer(
                      child: SizedBox(
                        height: 280,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {

                            return ListItemSales(
                              onPressed: () => null,
                              imageUrl:"https:///media/p"
                                  "roduct_images/1.jpg" ,
                              type: 'Nike',
                              name: 'T-Shirt Polo',
                              price: '500.00',
                            );
                          },
                        ),
                      ),
                    );
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('An error occurred: ${snapshot.error}'),
                    );
                  }
                  final products = snapshot.data?.products ?? [];

                  if (products.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }

                  return SizedBox(
                    height: 280,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item = products[index];

                        return ListItemSales(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductDetails(product: item),
                              ),
                            );
                            if (result == 'added') {
                              _showAddedSnackBar();
                            }
                          },
                          imageUrl: item.image ?? '',
                          type: item.brand ?? '',
                          name: item.name ?? '',
                          price: item.price ?? '',
                        );
                      },
                    ),
                  );
                },
              ),

              const Text("Glasses",
                textAlign: TextAlign.start,
                style: TextStyle( fontSize: 22,
                  fontWeight: FontWeight.bold,color: Colors.blue),),
              const SizedBox(height: 8),
              FutureBuilder<List<ProductModel>>(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No products found."));
                  }

                  final products = snapshot.data!;
                  final lastFour = products.length > 4
                      ? products.sublist(products.length - 4)
                      : products;

                  return SizedBox(
                    height: 200, // ارتفاع العنصر
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: lastFour.length,
                      itemBuilder: (context, index) {
                        final product = lastFour[index];
                        return Container(
                          width: 160,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.image,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "${product.brand} • \$${product.price}",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),


              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }



  void _showAddedSnackBar() {
    final snackBar = SnackBar(
      content: const Text(
        'Added to cart successfully.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold), // التحكم في حجم الخط
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 250), // وسط الشاشة
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20), // تحكم في حجم الصندوق
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




  Widget _carouselSliderBuilder() {
    List<String> imageList = [
      "assets/images/shimmer1.jpg",
      "assets/images/shimmer2.jpg",
      "assets/images/shimmer1.jpg",
      "assets/images/shimmer2.jpg",
    ];

    return ClipRRect(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          enlargeCenterPage: true,
          pageSnapping: true,
          padEnds: false,
          viewportFraction: 1,
          clipBehavior: Clip.none,
          height: 250,
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

  // Widget _builtHeaderofList(
  //     BuildContext context, {
  //       required String title,
  //       required String description,
  //       VoidCallback? onTap,
  //     }) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               title,
  //               style: const TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             InkWell(
  //               onTap: onTap,
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8),
  //                   color: Colors.blue.withOpacity(0.1),
  //                 ),
  //                 child: const Text(
  //                   "View all",
  //                   style: TextStyle(fontSize: 18, color: Colors.blue),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
