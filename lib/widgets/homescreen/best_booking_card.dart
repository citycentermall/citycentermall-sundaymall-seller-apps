import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class BestBookingCard extends StatelessWidget {
  const BestBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: const [
        BookingItem(
          image: 'assets/featured_products_images/nairart.png',
          name: 'Miss Zachary Will',
          role: 'Retailer',
          roleColor: AppColors.purple,
          description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
          avatar: 'assets/featured_products_images/avatar.png',
        ),
        SizedBox(height: 16),
        BookingItem(
          image: 'assets/featured_products_images/businessman.jpeg',
          name: 'Miss Zachary Will',
          role: 'Supplier',
          roleColor: AppColors.blue,
          description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
          avatar: 'assets/featured_products_images/avatar.png',
        ),
      ],
    );
  }
}

class BookingItem extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final Color roleColor;
  final String description;
  final String avatar;

  const BookingItem({
    required this.image,
    required this.name,
    required this.role,
    required this.roleColor,
    required this.description,
    required this.avatar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),

        // Avatar, Name, Role, Rating
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(avatar),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            children: [
                              const TextSpan(text: '  '),
                              TextSpan(
                                text: role,
                                style: TextStyle(
                                  color: roleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Rating Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F4FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: AppColors.blue, size: 14),
                            SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
