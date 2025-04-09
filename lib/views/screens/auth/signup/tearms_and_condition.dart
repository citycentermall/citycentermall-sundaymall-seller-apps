import 'package:flutter/material.dart';

import '../../../../widgets/gradient_button.dart';

class TermsConditionsPopup extends StatelessWidget {

  const TermsConditionsPopup({super.key, required this.onAgree});
  final VoidCallback onAgree;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: ListView(
          controller: controller,
          children: [
            const Center(
              child: Text(
                'Terms & Conditions and\nPrivacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '''
Terms and Conditions:
Acceptance: By using the Re-Dus app, you agree to comply with all applicable terms and conditions.

Usage: This app is for personal use only and may not be used for commercial purposes without permission.

Account: You are responsible for the security of your account and all activities that occur within it.

Content: You must not upload content that violates copyright, privacy, or applicable laws.

Changes: We reserve the right to change the terms and conditions at any time and will notify you of these changes through the app or via email.

Privacy Policy:
Data Collection: We collect personal data such as name, email, and location to process transactions and improve our services.

Data Usage: Your data is used for internal purposes such as account management, usage analysis, and service offerings.

Security: We protect your data with appropriate security measures to prevent unauthorized access.

Data Sharing: We do not share your personal data with third parties without your consent, except as required by law.

Your Rights: You can access, update, or delete your personal data at any time through the app’s settings or by contacting support.
              ''',
              style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 30),
            GradientButton(
              text: 'I Agree',
              onPressed: () {
                onAgree();
              },),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF3A3CF5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(45),
              ),
              child: const Text("Decline", style: TextStyle(color: Color(0xFF3A3CF5))),
            ),
          ],
        ),
      ),
    );
  }
}
