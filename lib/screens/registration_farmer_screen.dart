import 'package:flutter/material.dart';
import 'enter_details_screen.dart';

class RegistrationFarmerScreen extends StatefulWidget {
  const RegistrationFarmerScreen({super.key});

  @override
  State<RegistrationFarmerScreen> createState() => _RegistrationFarmerScreenState();
}

class _RegistrationFarmerScreenState extends State<RegistrationFarmerScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? _errorMessagePhone;
  String? _errorMessagePassword;

  void _validateAndNavigate() {
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    bool isValid = true;

    if (phone.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(phone)) {
      _errorMessagePhone = 'Please enter a valid 10-digit phone number';
      isValid = false;
    } else {
      _errorMessagePhone = null;
    }

    if (password.length < 8 ||
        !RegExp(r'[A-Za-z]').hasMatch(password) ||
        !RegExp(r'\d').hasMatch(password) ||
        !RegExp(r'[!@#\$%^&*~]').hasMatch(password)) {
      _errorMessagePassword =
      'Password must be 8+ characters, include letters, numbers & symbols';
      isValid = false;
    } else {
      _errorMessagePassword = null;
    }

    setState(() {});

    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnterDetailsScreen()),
      );
    }
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

                /// Image
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

                /// Welcome Text
                const Text(
                  'WELCOME FARMER',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF008054),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '"Connecting you to a better agricultural future."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 40),

                /// Phone Number Input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: _errorMessagePhone != null ? Colors.red : Colors.grey),
                  ),
                  child: Row(
                    children: [
                      const Text("+91", style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: "Mobile Number",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_errorMessagePhone != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _errorMessagePhone!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 20),

                /// Password Input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: _errorMessagePassword != null ? Colors.red : Colors.grey),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Create Password",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                if (_errorMessagePassword != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _errorMessagePassword!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 40),

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
                    onPressed: _validateAndNavigate,
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
