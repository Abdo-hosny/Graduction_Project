import 'package:flutter/material.dart';
import 'package:flutter_application_14/features/home_screen/home_bage.dart';
import '../../../APi/manger/api_anager.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/material_button.dart';
import '../../nav_bar.dart';
import '../logic/SignUpResponse.dart';
import '../logic/email.dart';
import 'login_Screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'signUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (firstName.isEmpty||lastName.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final user = RequestSignUpModel(
      lastName: lastName,
      firstName: firstName,
      email: email,
      password: password,
    );

    print("Request body: ${user.toJson()}");

    signUpUser(user).then((response) {
      // مثال: لو عندك response.message أو أي شرط بسيط
      if (response?.message == 'Account registration successful!') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Success"),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 1),
          ),
        );

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const NavBar()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message??""),
            backgroundColor: Colors.red,
          ),
        );
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $error"),
          backgroundColor: Colors.red,
        ),
      );
    });
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sign up',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextFormFieldWidget(
              hintText: 'Enter your Name',
              title: 'Name',
              controller: _firstNameController,
              myValidator: (text) => null,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: 'Enter your Name',
              title: 'Name',
              controller: _lastNameController,
              myValidator: (text) => null,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: 'Enter your Email',
              title: 'Email',
              controller: _emailController,
              myValidator: (text) => null,
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: "********",
              isPassword: true,
              obscureText: true,
              title: 'Password',
              controller: _passwordController,
              myValidator: (text) => null,
            ),
            const SizedBox(height: 30),
            MaterialButtonWidget(
              onPressed: _submitForm,
              title: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?',
                    style: TextStyle(fontSize: 18)),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: const Text('Log in',
                      style: TextStyle(color: Colors.red, fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
