// Full updated HomePage code with Apple product navigation added

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'category.dart';
import 'cart.dart';
import 'profile.dart';
import 'apple_products_deatils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String>> sliders = [
    {'image': 'assets/images/orange.jpg', 'text': 'Fresh oranges with 20% offer'},
    {'image': 'assets/images/rice.jpg', 'text': 'Best quality rice deals'},
    {'image': 'assets/images/vegetables.jpg', 'text': 'Fresh vegetables at your doorstep'},
    {'image': 'assets/images/millets.jpg', 'text': 'Healthy millets just a click away'},
    {'image': 'assets/images/greens.jpg', 'text': 'Green leaves with amazing freshness'},
  ];

  final List<Map<String, dynamic>> products = [
    {'image': 'assets/images/rice.jpg', 'name': 'Rice', 'price': '60', 'delivery': 'Monday 3 July', 'rating': 4.5},
    {'image': 'assets/images/tomato.jpg', 'name': 'Tomato', 'price': '30', 'delivery': 'Monday 3 July', 'rating': 4.2},
    {'image': 'assets/images/carrot.jpg', 'name': 'Carrot', 'price': '40', 'delivery': 'Tuesday 4 July', 'rating': 4.0},
    {'image': 'assets/images/onion.jpg', 'name': 'Onion', 'price': '25', 'delivery': 'Tuesday 4 July', 'rating': 4.1},
    {'image': 'assets/images/brinjal.jpg', 'name': 'Brinjal', 'price': '35', 'delivery': 'Wednesday 5 July', 'rating': 4.3},
    {'image': 'assets/images/beans.jpg', 'name': 'Beans', 'price': '45', 'delivery': 'Wednesday 5 July', 'rating': 4.4},
    {'image': 'assets/images/wheat.jpg', 'name': 'Wheat', 'price': '55', 'delivery': 'Thursday 6 July', 'rating': 4.6},
    {'image': 'assets/images/apple.jpg', 'name': 'Apple', 'price': '200', 'delivery': 'Thursday 8 July', 'rating': 4.7},
    {'image': 'assets/images/mango.jpg', 'name': 'Mango', 'price': '100', 'delivery': 'Thursday 8 July', 'rating': 4.6},
    {'image': 'assets/images/watermelon.jpg', 'name': 'Watermelon', 'price': '10', 'delivery': 'Thursday 6 July', 'rating': 4.6},
    {'image': 'assets/images/banana.jpg', 'name': 'Banana', 'price': '10', 'delivery': 'Thursday 6 July', 'rating': 4.6},
    {'image': 'assets/images/papaya.jpg', 'name': 'Papaya', 'price': '15', 'delivery': 'Thursday 6 July', 'rating': 4.6},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < sliders.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        centerTitle: true,
        title: Text(
          'FARMYZAAR',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.notifications, color: Colors.black, size: 30),
                Icon(Icons.notifications, color: Color(0xFFFABB1E), size: 28),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFD9FFD4),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: sliders.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = sliders[index];
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            color: Colors.black45,
                            child: Text(
                              item['text']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliders.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Shop by Top categories", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCircle(image: 'assets/images/vegetables.jpg', label: 'Vegetables'),
                  CategoryCircle(image: 'assets/images/rice.jpg', label: 'Rice & Wheat'),
                  CategoryCircle(image: 'assets/images/poultary.jpg', label: 'Poultry'),
                ],
              ),
              SizedBox(height: 15),
              Text("Featured Products", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListView.builder(
                itemCount: (products.length / 2).ceil(),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, rowIndex) {
                  final startIndex = rowIndex * 2;
                  final endIndex = startIndex + 1;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ProductTile(
                            image: products[startIndex]['image'],
                            name: products[startIndex]['name'],
                            price: products[startIndex]['price'],
                            delivery: products[startIndex]['delivery'],
                            rating: products[startIndex]['rating'],
                            onTap: () {
                              if (products[startIndex]['name'] == 'Apple') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => AppleProductsPage()),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        if (endIndex < products.length)
                          Expanded(
                            child: ProductTile(
                              image: products[endIndex]['image'],
                              name: products[endIndex]['name'],
                              price: products[endIndex]['price'],
                              delivery: products[endIndex]['delivery'],
                              rating: products[endIndex]['rating'],
                              onTap: () {
                                if (products[endIndex]['name'] == 'Apple') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => AppleProductsPage()),
                                  );
                                }
                              },
                            ),
                          )
                        else
                          Expanded(child: Container()),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          backgroundColor: const Color(0xFFCBF7B2),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class CategoryCircle extends StatelessWidget {
  final String image;
  final String label;

  const CategoryCircle({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 35, backgroundImage: AssetImage(image)),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class ProductTile extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String delivery;
  final double rating;
  final VoidCallback? onTap;

  const ProductTile({
    required this.image,
    required this.name,
    required this.price,
    required this.delivery,
    required this.rating,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(widget.image, height: 120, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("₹${widget.price}/Kg"),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < widget.rating.round() ? Icons.star : Icons.star_border,
                        size: 14,
                        color: Colors.orange,
                      );
                    }),
                  ),
                  Text("Free delivery", style: TextStyle(fontSize: 12)),
                  Text("Get it by ${widget.delivery}", style: TextStyle(fontSize: 12, color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SideMenuDrawer class remains unchanged...


// Make sure to import and include this class in your project
class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Colors.grey.shade800,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFCBF7B2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sahaj Maniya',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Text('Edit profile', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios, size: 12),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFCBF7B2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  _buildMenuItem(Icons.grid_view, 'Categories', Colors.green),
                  _buildMenuItem(Icons.favorite, 'Liked Products', Colors.green),
                  _buildMenuItem(Icons.shopping_bag, 'Your Products', Colors.green),
                  _buildMenuItem(Icons.policy, 'Government Policies', Colors.green),
                  _buildMenuItem(Icons.bar_chart, 'Market Rate', Colors.green),
                  _buildMenuItem(Icons.campaign, 'Promote', Colors.green),
                  _buildMenuItem(FontAwesomeIcons.whatsapp, 'WhatsApp', Colors.green),
                  _buildMenuItem(FontAwesomeIcons.youtube, 'Learn from YouTube', Colors.green),
                  _buildMenuItem(Icons.star_rate, 'Rate us', Colors.green),
                  _buildMenuItem(Icons.cloud, 'Weather', Colors.green),
                  _buildMenuItem(Icons.phone, 'Contact Us', Colors.green),
                  _buildMenuItem(Icons.description, 'T&C', Colors.green),
                  _buildMenuItem(Icons.info, 'Know About us', Colors.green),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.black38, thickness: 0.8),
                  const SizedBox(height: 6),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.blue),
                    title: const Text(
                      "Logout",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    onTap: () {},
                    dense: true,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildMenuItem(IconData icon, String title, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 8),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(color: Colors.black, fontSize: 14)),
        onTap: () {},
      ),
    );
  }
}