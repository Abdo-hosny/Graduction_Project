import 'package:flutter/material.dart';

import '../auth/pages/Sign_Up _screen.dart';
import '../auth/pages/login_Screen.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.jpeg',
              fit: BoxFit.fill,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 24),
            Image.asset(
              'assets/images/splash_screen.jpeg',
              fit: BoxFit.fill,
              height: 150,
              width: 350,
            ),
            // const SizedBox(height: 24),
            // const Text(
            //   'FiTMiRROR ',
            //   style: TextStyle(
            //     fontSize: 40,
            //     // color: Color(0xFFFC0000),
            //     color: Colors.red,
            //     shadows: [
            //       Shadow(
            //         // color: Color(0xffA6A4A5FF),
            //         color: Colors.grey,
            //         blurRadius: 4,
            //         offset: Offset(1, 5),
            //       ),
            //     ],
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const Text(
              'Virtual e-commerce',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff2E2D2A),
                // color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ),
    );
  }
}
