import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'package:agriapp/screens/profile_selection_screen.dart';
import 'package:agriapp/screens/enter_details_screen.dart';
import 'package:agriapp/screens/home_page.dart';
import 'package:agriapp/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriConnect',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/profileSelection': (context) => const ProfileSelectionScreen(),
        '/enterDetails': (context) =>  EnterDetailsScreen(), // Add const if it's stateless and requires no arguments
        '/home': (context) =>  HomePage(), // Ensure this has your full UI
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/profileSelection');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 200,
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 100, color: Colors.red);
              },
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

