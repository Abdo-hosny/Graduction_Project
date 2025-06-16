import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/widgets/custom_list_tile.dart';
import '../share_pre.dart';
import 'Setting_Screen.dart';
import '../auth/widget/promoCode.dart';
import '../my_order_screen.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profilePage';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        title: const Text(
          'My profile',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.search,
        //       size: 30,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.person,size: 50,),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( SharedPrefsService.getString("name")??"name",
                      style: const TextStyle(
                        fontSize: 30,
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

              ],
            ),
            const SizedBox(height: 40),
            CustomListTile(
              title: 'My Orders',
              subTitle: 'Already have 12 orders',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyOrdersScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            CustomListTile(
              title: 'Shipping addresses',
              subTitle: '3 addresses',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            CustomListTile(
              title: 'Payment methods',
              subTitle: 'Visa ****1234',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            CustomListTile(
              title: 'Promo codes',
              subTitle: 'You have special promo codes',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PromoCode(),
                ));
              },
            ),
            const SizedBox(height: 15),
            CustomListTile(
              title: 'My reviews',
              subTitle: 'Reviews for 4 items',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            CustomListTile(
              title: 'Settings',
              subTitle: 'Notifications, password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
