
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/Viewes/Badges/home_bage.dart';
import 'package:flutter_application_14/Viewes/Badges/nav_bar.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controllers.dart';
import '../services/auth.dart';
import 'auth_page.dart';

class LandingPage extends StatelessWidget {
  static const String routeName = 'landingPage';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.active) {
            final user = Snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthControllers>(
                create: (_)=>AuthControllers(auth: auth),
                child: const AuthPage());
            
            }
            return NavBar();
          }
          return Scaffold(
            body:Center(
              child:CircularProgressIndicator(

              ) ,
            )
          );
        });
  }
}
