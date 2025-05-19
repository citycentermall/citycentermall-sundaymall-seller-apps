import 'package:flutter/material.dart';

class AnotherProductSection extends StatelessWidget {
  const AnotherProductSection({Key? key}) : super(key: key);

  final products = const [
    {
      'image': 'assets/featured_products_images/productimages.png',
      'title': 'TMA-2 HD Wireless',
      'price': 'USD 350'
    },
    {
      'image': 'assets/featured_products_images/productimages.png',
      'title': 'CO2 – Cable',
      'price': 'USD 25'
    },
    {
      'image': 'assets/featured_products_images/productimages.png',
      'title': 'CO3 – Wireless',
      'price': 'USD 199'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'See All Reviews',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Another Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.042,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.04),
        SizedBox(
          height: screenWidth * 0.55,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.03),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                width: screenWidth * 0.36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      product['title']!,
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                    SizedBox(height: screenWidth * 0.01),
                    Text(
                      product['price']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.032,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: screenWidth * 0.05),
      ],
    );
  }
}
