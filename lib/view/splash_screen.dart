import 'dart:async';
import 'package:assignment/view/loginscreen/auth_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to the next screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const AuthScreen()), // Replace `NextScreen()` with your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Your splash screen UI here
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.jpg', // Change this to your image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
