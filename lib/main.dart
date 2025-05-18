//shared perferences
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<bool> _checkIfSignedUp() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('isSignedUp') ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder<bool>(
//         future: _checkIfSignedUp(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           } else if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(child: Text('Error: ${snapshot.error}')),
//             );
//           } else {
//             final isSignedUp = snapshot.data ?? false;
//             return isSignedUp ? const NavBar() : const SignUpScreen();
//           }
//         },
//       ),
//       routes: {
//         SignUpScreen.routeName: (context) => const SignUpScreen(),
//         NavBar.routeName: (context) => const NavBar(),
//       },
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color(0xffE5E5E5),
//         primaryColor: Colors.red,
//         inputDecorationTheme: InputDecorationTheme(
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Colors.grey),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'features/home_bage.dart';
import 'features/my_bag_screen.dart';
import 'features/nav_bar.dart';
import 'features/womens_tops_screen.dart';
import 'features/auth/pages/Sign_Up _screen.dart';
import 'features/cancelled_order.dart';
import 'features/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeBage.routeName: (context) => const HomeBage(),
        NavBar.routeName: (context) => const NavBar(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        CancelledOrderScreen.routeName: (context) =>
        const CancelledOrderScreen(),
        MyBagScreen.routeName: (context) => MyBagScreen(),
        WomenProducts.routeName: (context) => const WomenProducts(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE5E5E5),
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.titleMedium,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
