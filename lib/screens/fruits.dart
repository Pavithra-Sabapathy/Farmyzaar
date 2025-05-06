import 'package:flutter/material.dart';
import 'apple_products_deatils.dart';

// ✅ Custom Header Widget
class CustomHeader extends StatelessWidget {
  final String title;
  const CustomHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                  const Icon(Icons.notifications, color: Colors.black, size: 30),
                  const Icon(Icons.notifications, color: Color(0xFFFABB1E), size: 28),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Fruits Page With Navigation on Apple
class FruitsPage extends StatelessWidget {
  const FruitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fruits = [
      {'name': 'Apple', 'image': 'assets/images/apple.jpg', 'quantity': '5 Kg', 'price': '₹200/Kg'},
      {'name': 'Mango', 'image': 'assets/images/mango.jpg', 'quantity': '5 Kg', 'price': '₹150/Kg'},
      {'name': 'Banana', 'image': 'assets/images/banana.jpg', 'quantity': '5 Kg', 'price': '₹50/Kg'},
      {'name': 'Orange', 'image': 'assets/images/orange.jpg', 'quantity': '5 Kg', 'price': '₹60/Kg'},
      {'name': 'Pomegranate', 'image': 'assets/images/pomegranate.jpg', 'quantity': '5 Kg', 'price': '₹180/Kg'},
      {'name': 'Grapes', 'image': 'assets/images/grapes.jpg', 'quantity': '5 Kg', 'price': '₹90/Kg'},
      {'name': 'Papaya', 'image': 'assets/images/papaya.jpg', 'quantity': '5 Kg', 'price': '₹45/Kg'},
      {'name': 'Muskmelon', 'image': 'assets/images/muskmelon.jpg', 'quantity': '5 Kg', 'price': '₹70/Kg'},
      {'name': 'Blueberry', 'image': 'assets/images/blueberry.jpg', 'quantity': '5 Kg', 'price': '₹250/Kg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'Fruits'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                final fruit = fruits[index];

                final content = Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          fruit['image']!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fruit['name']!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Quantity\n${fruit['quantity']}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                                Text('Price\n${fruit['price']}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text('Free delivery\nGet it by Monday 3 July', style: TextStyle(color: Colors.green, fontSize: 11)),
                            const SizedBox(height: 4),
                            Row(
                              children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 16)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

                // Navigate to AppleProductDetailsPage only if Apple
                if (fruit['name'] == 'Apple') {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AppleProductsPage()),
                      );
                    },
                    child: content,
                  );
                } else {
                  return content;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


