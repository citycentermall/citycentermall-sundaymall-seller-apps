import 'package:flutter/material.dart';
import '../../../widgets/custom_input_field.dart';
import '../../../widgets/gradient_button.dart';
import 'forgot_password_otp_verification.dart';

class ForgotPasswordEmailVerifyScreeen extends StatelessWidget {
  ForgotPasswordEmailVerifyScreeen({super.key});
  final TextEditingController emailController = TextEditingController();

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

                        CustomInputField(
                          label: 'Email',
                          hintText: 'Enter Your Email',
                          prefixIcon: Icons.email_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
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
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                                ),
                                builder: (context) =>  OtpVerificationScreens(phoneNumber: "masum@gmail.com"),
                              );
                             // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreens(phoneNumber: 'masum@gmail.com',),));
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
                      width: 80,
                      height: 80,
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
                      // child: const Icon(
                      //   Icons.security,
                      //   color: Colors.white,
                      //   size: 32,
                      // ),
                      child: Image.asset("assets/images/securety.png"),
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
