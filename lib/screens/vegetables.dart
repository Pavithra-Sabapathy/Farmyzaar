import 'package:flutter/material.dart';
// Import your potato product detail screen here
import 'potato_products_details.dart';

class VegetablesPage extends StatelessWidget {
  const VegetablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vegetables = [
      {'name': 'Onion', 'image': 'assets/images/onion.jpg', 'quantity': '5 Kg', 'price': '₹25/Kg'},
      {'name': 'Tomato', 'image': 'assets/images/tomato.jpg', 'quantity': '3 Kg', 'price': '₹30/Kg'},
      {'name': 'Potato', 'image': 'assets/images/potato.jpg', 'quantity': '5 Kg', 'price': '₹40/Kg'},
      {'name': 'Cabbage', 'image': 'assets/images/cabbage.jpg', 'quantity': '2 Kg', 'price': '₹20/Kg'},
      {'name': 'Radish', 'image': 'assets/images/raddish.jpg', 'quantity': '2 Kg', 'price': '₹35/Kg'},
      {'name': 'Bottle Gourd', 'image': 'assets/images/bottle_guard.jpg', 'quantity': '3 Kg', 'price': '₹28/Kg'},
      {'name': 'Bitter Gourd', 'image': 'assets/images/bitter_guard.jpg', 'quantity': '1.5 Kg', 'price': '₹50/Kg'},
      {'name': 'Brinjal', 'image': 'assets/images/brinjal.jpg', 'quantity': '4 Kg', 'price': '₹35/Kg'},
      {'name': 'Carrot', 'image': 'assets/images/carrot.jpg', 'quantity': '3 Kg', 'price': '₹40/Kg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomHeader(title: 'Vegetables'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: vegetables.length,
              itemBuilder: (context, index) {
                final veg = vegetables[index];
                return GestureDetector(
                  onTap: () {
                    if (veg['name'] == 'Potato') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
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
                            veg['image']!,
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
                                veg['name']!,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Quantity\n${veg['quantity']}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
                                  Text('Price\n${veg['price']}', style: const TextStyle(color: Colors.black54, fontSize: 12)),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Make sure this matches your header component
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
                onPressed: () => Navigator.of(context).pop(),
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
              onPressed: () {},
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

