import 'package:flutter/material.dart';
import 'enter_details_screen.dart';

class RegistrationFarmerScreen extends StatefulWidget {
  const RegistrationFarmerScreen({super.key});

  @override
  State<RegistrationFarmerScreen> createState() => _RegistrationFarmerScreenState();
}

class _RegistrationFarmerScreenState extends State<RegistrationFarmerScreen> {
  void _navigateToEnterDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnterDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCDFAA9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                /// Back Icon
                Padding(
                  padding: const EdgeInsets.only(left: 23, right: 10, top: 25),
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// Registration Title
                const Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                /// Image with Container background matching the screen
                Center(
                  child: Container(
                    height: 250,
                    width: 330,
                    color: const Color(0xFFCDFAA9),
                    child: Image.asset(
                      'assets/images/otp_verification.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Welcome Farmer Text
                const Text(
                  'WELCOME FARMER',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF008054),
                  ),
                ),

                const SizedBox(height: 10),

                /// Quote or Description
                const Text(
                  '"Connecting you to a better agricultural future."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 60),

                /// Get Started Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF60C335),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _navigateToEnterDetails,
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


