import 'package:flutter/material.dart';
import 'package:shoping_app/constants/global_variable.dart';

enum Auth {
  signIn,
  singUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.singUp;
  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              RadioListTile<Auth>(
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.singUp,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),

              if(_auth==Auth.singUp)
                  Form(
                    key:_signupFormKey,
                    child: Container(),
                  ),


              RadioListTile<Auth>(
                title: const Text(
                  'Sign-in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.signIn,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
