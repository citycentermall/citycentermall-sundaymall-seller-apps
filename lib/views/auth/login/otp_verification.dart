import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sunday_mall/views/screens/bottom_nav_bar.dart';
import '../../../../widgets/gradient_button.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required String phoneNumber});

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
                    "Sign In Phone Number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    "Sign in code has been sent to {$PhoneNumber}, check \n your inbox to continue the sign in process.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedColor: Colors.blue,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey.shade300,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (value) {},
                  ),
                  // SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Haven’t received the sign in code? "),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Resend it."),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Verify OTP Button
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF19235E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:  GradientButton(
                      text: 'Submit',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                      },),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
            // Top Icon
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/icons/call.png',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

