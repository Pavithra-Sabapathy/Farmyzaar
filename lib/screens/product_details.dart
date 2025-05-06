import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'sellproductsscreen.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _productImage;
  String? _selectedUnit;
  DateTime? _selectedDate;
  String? _selectedDistrict;
  String? _selectedState;

  List<String> units = ["grams", "kilograms", "liters", "milliliters"];
  List<String> districts = ['Ariyalur', 'Chengalpattu', 'Chennai', 'Coimbatore', 'Cuddalore',
    'Dharmapuri', 'Dindigul', 'Erode', 'Kallakurichi', 'Kanchipuram',
    'Kanyakumari', 'Karur', 'Krishnagiri', 'Madurai', 'Mayiladuthurai',
    'Nagapattinam', 'Namakkal', 'Nilgiris', 'Perambalur', 'Pudukkottai',
    'Ramanathapuram', 'Ranipet', 'Salem', 'Sivaganga', 'Tenkasi',
    'Thanjavur', 'Theni', 'Thoothukudi', 'Tiruchirappalli', 'Tirunelveli',
    'Tirupathur', 'Tiruppur', 'Tiruvallur', 'Tiruvannamalai', 'Tiruvarur',
    'Vellore', 'Viluppuram', 'Virudhunagar'];
  List<String> states = ["Tamil Nadu"];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _productImage = File(image.path);
      });
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: CustomHeader(title: "Product Details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAlphabetTextField("Category*", "eg. Vegetables, Fruits, wheat etc."),
                  buildAlphabetTextField("Title*", "Enter Title"),
                  buildAlphabetTextField("Description*", "Details about your product", maxLines: 3),

                  buildQuantityWithUnitField("Item Quantity*", "Enter quantity"),
                  buildNumericTextField("Expected Price*", "Approximate Price"),
                  buildDateField("Available From*", context),
                  buildMobileNumberField("Mobile Number*"),

                  SizedBox(height: 20),

                  buildAlphanumericTextField("Current Address*", "House Door number & street name"),
                  buildAlphabetTextField("City*", "Your City"),
                  buildDropdown("Select District*", districts, _selectedDistrict, (newValue) {
                    setState(() {
                      _selectedDistrict = newValue;
                    });
                  }, "Select District"),
                  buildDropdown("Select State*", states, _selectedState, (newValue) {
                    setState(() {
                      _selectedState = newValue;
                    });
                  }, "Select State"),

                  SizedBox(height: 20),

                  Text(
                    "Upload Photo*",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFCBF7B2),
                      ),
                      child: _productImage == null
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
                          : Image.file(_productImage!, fit: BoxFit.cover),
                    ),
                  ),

                  SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Success"),
                              content: Text("Product Details Submitted Successfully!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => SellProductsScreen()),
                                    );
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                      child: Text("Sell", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hintText, int maxLines, String pattern, String errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextFormField(
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            } else if (!RegExp(pattern).hasMatch(value)) {
              return errorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Color(0xFFCBF7B2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildAlphabetTextField(String label, String hintText, {int maxLines = 1}) {
    return buildTextField(
      label,
      hintText,
      maxLines,
      r'^[a-zA-Z\s]+$',
      "Only alphabets allowed",
    );
  }

  Widget buildNumericTextField(String label, String hintText) {
    return buildTextField(
      label,
      hintText,
      1,
      r'^[0-9]+$',
      "Only numbers allowed",
    );
  }

  Widget buildAlphanumericTextField(String label, String hintText) {
    return buildTextField(
      label,
      hintText,
      1,
      r'^[a-zA-Z0-9\s,]+$',
      "Only alphanumeric characters allowed",
    );
  }

  Widget buildMobileNumberField(String label) {
    return buildTextField(
      label,
      "Enter Mobile number",
      1,
      r'^\d{10}$',
      "Enter a valid Mobile number",
    );
  }

  Widget buildDateField(String label, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        InkWell(
          onTap: () => _pickDate(context),
          child: Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFCBF7B2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black45),
            ),
            child: Text(
              _selectedDate == null ? "Select Date" : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged, [String? hintText]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text(hintText ?? label),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFCBF7B2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildQuantityWithUnitField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFCBF7B2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black45),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Quantity is required";
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Only numbers allowed";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 1,
                color: Colors.black38,
              ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  hint: Text("Unit"),
                  items: units.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedUnit = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

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


