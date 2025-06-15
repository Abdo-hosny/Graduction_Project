import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../APi/manger/api_anager.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/material_button.dart';
import '../../nav_bar.dart';
import '../logic/SignUpResponse.dart';
import 'Sign_Up _screen.dart';
import 'forget_password_Screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName="login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


class _LoginScreenState extends State<LoginScreen> {

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      // TODO: Use email & password for login logic
      log("Login pressed with email: $email and password: $password");
      _signIn();
    }
  }

  Future<void> _signIn() async {
    SignInModelRequest user = SignInModelRequest(
      email: _emailController.text,
      password: _passwordController.text,
    );

    SignUpResponse response = await signInUser(user);
    print(response.message);
    if (response.success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Success"),

          backgroundColor: Colors.blue,
        ),
      );
      Navigator.of(context).pushReplacementNamed(NavBar.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFDFF),
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
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              TextFormFieldWidget(
                hintText: 'Enter your Email',
                title: 'Email',
                controller: _emailController,
                myValidator: (text) => null,
              ),
              const SizedBox(height: 20),
              TextFormFieldWidget(
                hintText: " * * * * * * * *",
                isPassword: true,
                obscureText: true,
                title: 'Password',
                controller: _passwordController,
                myValidator: (text) => null,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: const Text(
                        'Forget your password?',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context, SignUpScreen.routeName,
                      );
                    },
                    child: const Text('Singn Up',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MaterialButtonWidget(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, NavBar.routeName);
                  } , title: const Text('Login')),

              SizedBox(height: MediaQuery.of(context).size.height * 0.08),

              const Center(
                child: Text(
                  'Or sign up with social account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              // SizedBox(height: 10),
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
