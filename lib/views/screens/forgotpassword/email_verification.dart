import 'package:flutter/material.dart';

import '../../../widgets/gradient_button.dart';
import 'forgot_password_otp_verification.dart';

class ForgotPasswordEmailVerifyScreeen extends StatefulWidget {
  const ForgotPasswordEmailVerifyScreeen({super.key});

  @override
  State<ForgotPasswordEmailVerifyScreeen> createState() => _ForgotPasswordEmailVerifyScreeenState();
}

class _ForgotPasswordEmailVerifyScreeenState extends State<ForgotPasswordEmailVerifyScreeen> {
  final TextEditingController emailController = TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    const iconHeight = 64.0;
    const halfIconHeight = iconHeight / 2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0B0F4E),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: viewInsets),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.55),
            Container(
              width: double.infinity,
              height: size.height * 0.50,
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
                          "Forgot Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "A verification code will be sent to your email to reset your password.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email"),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "My email",
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3549C4), Color(0xFF5273691),Color(0xFF19235E)],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: GradientButton(
                            text: 'Send Verification code',
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreens(phoneNumber: 'masum@gmail.com',),));
                            },),
                        ),
                        const SizedBox(height: 40), // Button lower
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
                        Icons.security,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}