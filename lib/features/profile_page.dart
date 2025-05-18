import 'package:flutter/material.dart';
import 'package:flutter_application_14/core/widgets/custom_list_tile.dart';
import 'Setting_Screen.dart';
import 'auth/widget/promoCode.dart';
import 'my_order_screen.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profilePage';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundImage: AssetImage('assets/images (2).jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mahmoud Elghanam',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Mahmoud Elghanam@gmail.com',
                        style: TextStyle(
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
              title: 'Promocodes',
              subTitle: 'You have special promocodes',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PromoCode(),
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
