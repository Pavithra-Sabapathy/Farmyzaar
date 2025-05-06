import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registration_farmer_screen.dart';
import 'registration_screen.dart'; // Import the customer registration screen

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? selectedProfile = "Farmer"; // Default selection is Farmer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Logo Image
            Image.asset(
              'assets/images/logo.jpg',
              height: 80,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 60, color: Colors.red);
              },
            ),

            const SizedBox(height: 30),

            // Profile Selection Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Please, Select your Profile!!',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ListTile(
                    leading: Radio(
                      value: "Farmer",
                      groupValue: selectedProfile,
                      onChanged: (value) {
                        setState(() {
                          selectedProfile = value as String?;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    title: const Text("Farmer"),
                  ),
                  ListTile(
                    leading: Radio(
                      value: "Customer",
                      groupValue: selectedProfile,
                      onChanged: (value) {
                        setState(() {
                          selectedProfile = value as String?;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    title: const Text("Customer"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Welcome Message
            Text(
              'WELCOME TO AGRI CONNECT!',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'From field to Market\n"Your Agri Connect is here"',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 30),

            // Log In Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // <-- Updated here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                'Log In',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Create New Account Button with logic
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedProfile == "Farmer") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const RegistrationFarmerScreen()),
                      );
                    } else if (selectedProfile == "Customer") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()),
                      );
                    }
                  },
                  child: Text(
                    "Create New Account",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

