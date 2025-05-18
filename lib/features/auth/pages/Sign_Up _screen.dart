import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nav_bar.dart';
import 'login_Screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signUpScreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  //suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
              ),
              const SizedBox(height: 20),
              
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text('Log in',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isSignedUp', true);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const NavBar()),
                    );
                  },

                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => NavBar()),
                  //     );

                  // },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              const Center(
                child: Text(
                  'Or sign up with social account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              //SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Image.asset('assets/Google.png'),
                  //   iconSize: 40,
                  //   onPressed: () {},
                  // ),
                  // IconButton(
                  //   icon: Image.asset('assets/images/Facebook.png'),
                  //   iconSize: 10,
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
