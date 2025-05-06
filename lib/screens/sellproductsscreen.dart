import 'package:flutter/material.dart';
import 'product_details.dart'; // Import Product Details Page

class SellProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ Custom Header
          CustomHeader(title: "AGRICONNECT"),

          // ✅ Page Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),

                  SizedBox(height: 20),
                  // ✅ Image Section
                  Image.asset(
                    'assets/images/sell_products.jpg',
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),

                  // ✅ Title
                  Text(
                    "Sell Products",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),

                  // ✅ Subtitle
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(text: "Get the Best "),
                        TextSpan(
                          text: "Pricing.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // ✅ Description
                  Text(
                    "Simplify your orders, stay informed with real-time updates, and connect with experts for personalized advice.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  Spacer(),

                  // ✅ "Sell Now" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductDetailsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Sell Now",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Custom Header Widget
class CustomHeader extends StatelessWidget {
  final String title;
  CustomHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Keeping the same header height
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFCBF7B2), // Light green background
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 23, right: 10, top: 25), // ✅ Lowering text & icons slightly
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ✅ Back Arrow (Left)
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
            // ✅ Centered Title
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


