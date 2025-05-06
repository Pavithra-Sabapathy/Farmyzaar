import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'vegetables.dart';
import 'profile.dart';
import 'fruits.dart'; // ✅ Make sure this file exists and has a FruitsPage widget
import 'cart.dart';
import 'home_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SideMenuDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text(
            'FARMYZAAR',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
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
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFCBF7B2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search any categories',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  contentPadding: EdgeInsets.only(top: 10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1,
              children: [
                const CategoryCard(label: 'Millets', imagePath: 'assets/images/millets.jpg'),
                const CategoryCard(label: 'Rice & Wheat', imagePath: 'assets/images/rice.jpg'),
                CategoryCard(
                  label: 'Vegetables',
                  imagePath: 'assets/images/vegetables.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VegetablesPage()),
                    );
                  },
                ),
                CategoryCard( // ✅ Now navigates to FruitsPage
                  label: 'Fruits',
                  imagePath: 'assets/images/fruits.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FruitsPage()),
                    );
                  },
                ),
                const CategoryCard(label: 'Poultry', imagePath: 'assets/images/poultry.jpg'),
                const CategoryCard(label: 'Honey', imagePath: 'assets/images/honeys.jpg'),
                const CategoryCard(label: 'Egg', imagePath: 'assets/images/egg.jpg'),
                const CategoryCard(label: 'Wool', imagePath: 'assets/images/wool.jpg'),
                const CategoryCard(label: 'Flower Plants', imagePath: 'assets/images/flower_plant.jpg'),
                const CategoryCard(label: 'Silk Sarees', imagePath: 'assets/images/silk_saree.jpg'),
                const CategoryCard(label: 'Animal Food', imagePath: 'assets/images/animal_food.jpg'),
                const CategoryCard(label: 'Others', imagePath: 'assets/images/others.jpg'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFCBF7B2),
          onTap: (index) {
            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            }
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }
            else if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
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

class CategoryCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.label,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFF60C335),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Text(
                              'Edit profile',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        onTap: () {},
      ),
    );
  }
}