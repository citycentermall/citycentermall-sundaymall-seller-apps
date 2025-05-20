import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  final List<Map<String, String>> services = const [
    {
      'title': 'Nair Art',
      'price': '\$399',
      'oldPrice': '\$599',
      'rating': '4.9',
      'image': 'assets/featured_products_images/nairart.png',
      'description': 'Facere necessitatibus aut sequi voluptatem totam eum veniam harum saepe...',
      'avatar': 'assets/featured_products_images/avatar.png',
      'name': 'Miss Zachary Will',
      'role': 'BEAUTICIAN',
    },
    {
      'title': 'Hair Cutting',
      'price': '\$199',
      'oldPrice': '\$299',
      'rating': '4.8',
      'image': 'assets/featured_products_images/hearart.png',
      'description': 'Lorem ipsum dolor sit amet consectetur adipisicing elit...',
      'avatar': 'assets/featured_products_images/avatar.png',
      'name': 'Mr. John Smith',
      'role': 'STYLIST',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final fontScale = screenWidth / 400;

    final cardWidth = screenWidth * 0.65;
    final imageHeight = isLandscape ? screenHeight * 0.3 : screenWidth * 0.4;

    return SizedBox(
      height: imageHeight + 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final service = services[index];

          return Container(
            width: cardWidth,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),

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
                        service['image']!,
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and Price Row
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                service['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16 * fontScale,
                                ),
                              ),
                            ),
                            Text(
                              service['price']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16 * fontScale,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              service['oldPrice']!,
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 13 * fontScale,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Rating Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6E9FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, size: 14, color: AppColors.blue),
                              const SizedBox(width: 4),
                              Text(
                                service['rating']!,
                                style: TextStyle(
                                  fontSize: 12 * fontScale,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          service['description']!,
                          style: TextStyle(fontSize: 12 * fontScale, color: Colors.black87),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          "more",
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 12 * fontScale,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Beautician Info
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(service['avatar']!),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
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
