
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/Viewes/Badges/home_bage.dart';
import 'package:flutter_application_14/Viewes/Badges/nav_bar.dart';
import 'package:provider/provider.dart';

import 'auth/pages/auth_page.dart';

import 'auth/pages/landing_page.dart';
import 'auth/services/auth.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) =>Auth() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LandingPage.routeName,
        routes: {
          AuthPage.routeName: (context) => AuthPage(),
          HomeBage.routeName: (context) => HomeBage(),
          LandingPage.routeName: (context) => LandingPage(),
          NavBar.routeName: (context) => NavBar(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffE5E5E5),
          primaryColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
