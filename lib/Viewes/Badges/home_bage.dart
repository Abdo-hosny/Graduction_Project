// import 'package:flutter/material.dart';
// import 'package:flutter_application_14/Utilities/images.dart';
// import 'package:flutter_application_14/Viewes/widgets/list_item_home.dart';
// import 'package:flutter_application_14/models/products.dart';

// class HomeBage extends StatelessWidget {
//   static const String routeName = 'homePage';

//   const HomeBage({super.key});
//   Widget _builtHeaderofList(
//     BuildContext context, {
//     required String title,
//     required String description,
//     VoidCallback? onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style:
//                     const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//               InkWell(
//                   onTap: onTap,
//                   child: Text(
//                     "View all",
//                     style: TextStyle(fontSize: 20),
//                   ))
//             ],
//           ),
//         //  Text(
//         //     description,
//         //     style: const TextStyle(fontSize: 18),
//         //   ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 300,
//             width: double.infinity,
//             child: Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 Image.network(Appassets.topBannerHomebage),
//                 Opacity(
//                   opacity: 0.3,
//                   child: Container(
//                     height: size.height * .4,
//                     width: double.infinity,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(18.0),
//                   child: Text(
//                     "Dresses",
//                     style: TextStyle(
//                         fontSize: 35,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           _builtHeaderofList(context, title: "Sales", description: "super sales"),
//           const SizedBox(
//             height: 8,
//           ),
//           SizedBox(
//               height: 240,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: dummyproducts
//                     .map((e) => Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListItemHome(products: e),
//                         ))
//                     .toList(),
//               )),
//           _builtHeaderofList(context, title: "NEW", description: "New Fashion"),
//           const SizedBox(
//             height: 8,
//           ),
//           SizedBox(
//               height: 240,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: dummyproducts
//                     .map((e) => Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListItemHome(products: e),
//                         ))
//                     .toList(),
//               )),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_14/Utilities/images.dart';
import 'package:flutter_application_14/Viewes/widgets/list_item_home.dart';
import 'package:flutter_application_14/models/products.dart';

class HomeBage extends StatelessWidget {
  static const String routeName = 'homePage';

  const HomeBage({super.key});

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
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.withOpacity(0.1), // Add slight background
                  ),
                  child: Text(
                    "View all",
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner Section
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    Appassets.topBannerHomebage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Dresses",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _builtHeaderofList(
              context,
              title: "Sales",
              description: "Super sales",
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dummyproducts
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListItemHome(products: e),
                        ))
                    .toList(),
              ),
            ),
            _builtHeaderofList(
              context,
              title: "NEW",
              description: "New Fashion",
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: dummyproducts
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListItemHome(products: e),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
