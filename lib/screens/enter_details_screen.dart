import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'sellproductsscreen.dart';

// ✅ Enter Details Screen
class EnterDetailsScreen extends StatefulWidget {
  @override
  _EnterDetailsScreenState createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _aadharImage;
  File? _uzhavarImage;

  final List<String> districts = [
    'Ariyalur', 'Chengalpattu', 'Chennai', 'Coimbatore', 'Cuddalore',
    'Dharmapuri', 'Dindigul', 'Erode', 'Kallakurichi', 'Kanchipuram',
    'Kanyakumari', 'Karur', 'Krishnagiri', 'Madurai', 'Mayiladuthurai',
    'Nagapattinam', 'Namakkal', 'Nilgiris', 'Perambalur', 'Pudukkottai',
    'Ramanathapuram', 'Ranipet', 'Salem', 'Sivaganga', 'Tenkasi',
    'Thanjavur', 'Theni', 'Thoothukudi', 'Tiruchirappalli', 'Tirunelveli',
    'Tirupathur', 'Tiruppur', 'Tiruvallur', 'Tiruvannamalai', 'Tiruvarur',
    'Vellore', 'Viluppuram', 'Virudhunagar'
  ];
  final List<String> states = ['Tamil Nadu'];

  String? selectedDistrict;
  String? selectedState;

  Future<void> _pickImage(bool isAadhar) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isAadhar) {
          _aadharImage = File(image.path);
        } else {
          _uzhavarImage = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Using Custom Header
      body: Column(
        children: [
          CustomHeader(title: "AGRICONNECT"),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Enter your details !!",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF008054)),
                        ),
                      ),
                      SizedBox(height: 20),

                      buildTextField("Full Name*", "Enter your full name"),
                      buildTextField("Email*", "Enter valid Email"),
                      buildTextField("Location*", "Current Location"),
                      buildTextField("Address*", "Enter your address"),

                      buildDropdown("District*", districts, (value) => selectedDistrict = value, "Select your district"),
                      buildDropdown("State*", states, (value) => selectedState = value, "Select your state"),

                      buildTextField("Mobile Number*", "Your Mobile Number"),
                      buildTextField("Aadhar Number*", "Your Aadhar Number"),
                      buildTextField("Uzhavar ID*", "Your Uzhavar ID"),

                      SizedBox(height: 10),

                      buildImageUploadSection("Upload Aadhar Card*", _aadharImage, () => _pickImage(true)),
                      SizedBox(height: 10),
                      buildImageUploadSection("Upload Uzhavar Card*", _uzhavarImage, () => _pickImage(false)),

                      SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Form Submitted Successfully"),
                                    content: Text("Your details have been recorded."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SellProductsScreen()),
                                          );
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          ),
                          child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Color(0xFFCBF7B2),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> items, Function(String?) onChanged, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFCBF7B2),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          hint: Text(hintText, style: TextStyle(color: Colors.black54)),
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildImageUploadSection(String label, File? image, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFCBF7B2),
            ),
            child: image == null
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 50, color: Colors.black45),
                Text(
                  "Select photos from your device",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(image, fit: BoxFit.cover, width: double.infinity, height: 150),
            ),
          ),
        ),
      ],
    );
  }
}

// ✅ Custom Header (Same as Sell Products Screen)
class CustomHeader extends StatelessWidget {
  final String title;
  CustomHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFCBF7B2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 23, right: 10, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF008054),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Bell icon
              },
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Outline (black) - slightly bigger
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30, // slightly bigger for border effect
                  ),
                  // Main icon (yellow)
                  Icon(
                    Icons.notifications,
                    color: Color(0xFFFABB1E),
                    size: 28,
                  ),
                  // Notification badge
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

