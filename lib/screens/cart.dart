import 'package:flutter/material.dart';
import 'home_page.dart'; // Make sure this file exists and contains HomePage

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Custom App Bar
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFCBF7B2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 23, right: 10, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.black),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                  ),

                  const Expanded(
                    child: Text(
                      'My Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF008054),
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 30,
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Color(0xFFFABB1E),
                          size: 28,
                        ),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          // Address Box
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_pin, size: 20, color: Colors.black),
                    SizedBox(width: 6),
                    Text("Your Pincode: 608430", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(Icons.edit, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text("Change Address", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Address:\n", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "Flat No:103, Lotus Colony, Chennai\n"),
                      TextSpan(text: "Sahaj Maniya: 9875641237"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text("Products in your cart:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text("3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Product List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                CartItemWidget(
                  name: "Potato",
                  price: 40,
                  originalPrice: 70,
                  image: "assets/images/potato.jpg",
                ),
                CartItemWidget(
                  name: "Onion",
                  price: 25,
                  originalPrice: 50,
                  image: "assets/images/onion.jpg",
                ),
                CartItemWidget(
                  name: "Apple",
                  price: 200,
                  originalPrice: 270,
                  image: "assets/images/apple.jpg",
                ),
              ],
            ),
          ),

          // Bill & Place Order
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ]),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Bill Details:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Spacer(),
                    Icon(Icons.currency_rupee, size: 18),
                    Text("265", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text("Place Order", style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String name;
  final int price;
  final int originalPrice;
  final String image;

  const CartItemWidget({
    super.key,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Spacer(),
                    const Icon(Icons.close, size: 18, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 4),
                const Text("Available in stock", style: TextStyle(color: Colors.green, fontSize: 12)),
                const Text("Estimated delivery: 4 - 5 days", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: const Row(
                        children: [
                          Icon(Icons.remove, size: 16, color: Colors.green),
                          SizedBox(width: 8),
                          Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.add, size: 16, color: Colors.green),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text("₹$price/Kg", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    Text("₹$originalPrice/Kg", style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Text("11% off", style: TextStyle(fontSize: 12, color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

