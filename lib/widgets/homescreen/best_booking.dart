import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DealOfTheDayCard extends StatelessWidget {
  const DealOfTheDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FD), // light background same as image
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.shade100),
      ),
      child: Stack(
        children: [
          // Optional: Add faded background icons here as Positioned widgets if needed

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Side: Text & Timer
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deal Of The Day',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.black45,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Flat 60% OFF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Aliquid soluta sed repellendus dignissimos culpa id.\nDolorem molestias itaque neque similique.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.black54,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Countdown
                    const Row(
                      children: [
                        TimeBox(time: '06'),
                        SizedBox(width: 4),
                        Text(
                          ':',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 4),
                        TimeBox(time: '34'),
                        SizedBox(width: 4),
                        Text(
                          ':',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 4),
                        TimeBox(time: '14'),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Shop Now Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Shop Now',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Girl Image
              Image.asset(
                'assets/featured_products_images/best_booking_girl.png',
                height: 160,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  final String time;
  const TimeBox({required this.time, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        time,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
