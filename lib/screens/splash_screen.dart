import 'dart:async';
import 'package:flutter/material.dart';
import 'package:agriapp/screens/profile_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/profileSelection');  // Navigate to Profile Selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // White background
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 60, color: Colors.red); // Error icon if image fails
              },
            ),
            const SizedBox(height: 10),  // Space between image and text
            const Text(
              'EMPOWERING FARMERS WITH ONLINE SALES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


