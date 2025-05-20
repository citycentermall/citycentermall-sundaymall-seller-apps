import 'package:flutter/material.dart';
import 'package:sunday_mall/utils/app_colors.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Watch',
      'price': '\$40',
      'image': 'assets/featured_products_images/watch.png'
    },
    {
      'name': 'Nike Shoes',
      'price': '\$430',
      'image': 'assets/featured_products_images/nike_shoes.png'
    },
    {
      'name': 'Airpods',
      'price': '\$333',
      'image': 'assets/featured_products_images/airboat.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.38;
    final imageHeight = screenWidth * 0.28;
    final boxHeight = screenWidth * 0.48;

    return SizedBox(
      height: boxHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final product = products[index];

          return Container(
            width: cardWidth,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with heart icon
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        product['image']!,
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),

                // Product details
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product['price']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.deepPurple,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
