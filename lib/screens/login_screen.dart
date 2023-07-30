import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_app/widgets/custom_button.dart';

import '../resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideInUp(
            duration: Duration(milliseconds: 500),
            child: Text(
              'Start or join a meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: SlideInLeft(
                duration: Duration(milliseconds: 2500),
                child: Image.asset('assets/images/onboarding.jpg')),
          ),
          ZoomIn(
            duration: Duration(milliseconds: 4000),
            child: CustomButton(
              text: 'Google Sign In',
              onPressed: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/home');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
