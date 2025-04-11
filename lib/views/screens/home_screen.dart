import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> categories = [
    {'title': 'Automotive', 'image': 'assets/cat1.png'},
    {'title': 'Baby Products', 'image': 'assets/cat2.png'},
    {'title': 'Grocery', 'image': 'assets/cat3.png'},
    {'title': 'Toys', 'image': 'assets/cat4.png'},
  ];

  final List<Map<String, String>> products = [
    {'name': 'TMA-2 HD Wireless', 'price': '\$150', 'image': 'assets/images/earphones.jpg'},
    {'name': 'Watch', 'price': '\$40', 'image': 'assets/images/watch.jpg'},
    {'name': 'Nike Shoes', 'price': '\$130', 'image': 'assets/images/shoes.jpg'},
  ];

  final List<Map<String, String>> services = [
    {
      'title': 'Nair Art',
      'price': '\$399',
      'image': 'assets/images/nair.jpg',
      'user': 'Miss Zachary Will',
      'role': 'Beautician'
    },
    {
      'title': 'Hair Cutting',
      'price': '\$299',
      'image': 'assets/images/hair.jpg',
      'user': 'Miss Zachary Will',
      'role': 'Beautician'
    },
  ];

  int _currentSlider = 0;
  late PageController _pageController;
  late Timer _timer;

  final List<String> sliderImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentSlider < sliderImages.length - 1) {
        _currentSlider++;
      } else {
        _currentSlider = 0;
      }
      _pageController.animateToPage(
        _currentSlider,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
            child: Text("Masum Raja",)
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 60,
              width: 60,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: sliderImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        sliderImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(categories[index]['image']!),
                          radius: 30,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          categories[index]['title']!,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Featured Products', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        Image.asset(products[index]['image']!, height: 100),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(products[index]['name']!, style: const TextStyle(fontSize: 14)),
                        ),
                        Text(products[index]['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Best Bookings', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...services.map((service) {
              return ListTile(
                leading: Image.asset(service['image']!, height: 60, width: 60, fit: BoxFit.cover),
                title: Text(service['title']!),
                subtitle: Text('${service['user']} • ${service['role']}'),
                trailing: Text(service['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}