import 'package:flutter/material.dart';
import 'package:sunday_mall/views/profile/profile_updated.dart';

import '../../widgets/gradient_button.dart';

class showUpdateProfileBottomSheet extends StatelessWidget {
  const showUpdateProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    const iconHeight = 64.0;
    const halfIconHeight = iconHeight / 2;

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 90, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Updated Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Are you sure you want to update your profile? This will help us improve your experience and provide personalized features.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),


                  GradientButton(
                    text: "Yes ' update profile",
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        builder: (context) => const UpdatedProfile(),
                      );
                      showBottomSheet(context: context, builder: (context) => UpdatedProfile(),);
                  },),
                  const SizedBox(height: 16),

                  // No Button
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF19235E)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: const Text(
                      "No, let me check",
                      style: TextStyle(color: Color(0xFF19235E)),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Positioned(
              top: -halfIconHeight,
              left: size.width / 2 - 32,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF3649C3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
