
import 'package:flutter/material.dart';
import 'package:flutter_application_14/Viewes/Badges/nav_bar.dart';

import 'package:provider/provider.dart';

import '../../Viewes/Badges/home_bage.dart';
import '../controllers/auth_controllers.dart';
import '../utilities/enums.dart';
import '../widget/main_button.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = 'loginPage';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthControllers model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(NavBar.routeName);
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Error',
                style: Theme.of(context).textTheme.bodyLarge,
                ),
                content: Text(e.toString()),
                actions: [
                  TextButton(onPressed: ()=>Navigator.of(context).pop(), 
                  child: Text('Ok')
                  ),
                ],
                
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthControllers>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 66),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.authFormType == AuthFormType.login
                        ? 'Login'
                        : 'Register',
                    style: TextStyle(fontSize: 24, color: Color(0xff000000)),
                  ),
                  SizedBox(height: 64),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    onChanged: model.updateEmail,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your email' : null,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your password' : null,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onChanged: model.updatePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  if (model.authFormType == AuthFormType.login)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  SizedBox(height: 24),
                  MainButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _submit(model);
                      }
                    },
                    text: model.authFormType == AuthFormType.login
                        ? 'Login'
                        : 'Register',
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        _formKey.currentState!.reset();
                        model.toggleFormType();
                      },
                      child: Text(
                        model.authFormType == AuthFormType.login
                            ? 'Don\'t have an account? Register'
                            : 'Have an account? Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      model.authFormType == AuthFormType.login
                          ? 'Or login with a social account'
                          : 'Or register with a social account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 35,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 80,
                        width: 80,
                        child: ImageIcon(AssetImage(
                          'assets/gmail.png',
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
