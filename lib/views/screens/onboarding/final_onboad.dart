import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/auth/signup/signup_screen.dart';
import '../auth/login/signin_with_email.dart';

class FinalOnboardingScreen extends StatelessWidget {
  const FinalOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3A3CF5), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 15,

                    children: [
                      // First row
                      _imageBox('assets/images/first.png', screenWidth * 0.24, screenWidth * 0.3),
                      _imageBox('assets/images/second.png', screenWidth * 0.3, screenWidth * 0.4),
                      _imageBox('assets/images/third.png', screenWidth * 0.3, screenWidth * 0.4),

                      // Second row
                      _imageBox('assets/images/fortth.png', screenWidth * 0.28, screenWidth * 0.35),
                      _imageBox('assets/images/five.png', screenWidth * 0.28, screenWidth * 0.35),
                      _imageBox('assets/images/six.png', screenWidth * 0.28, screenWidth * 0.35),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Navigate Your Work Journey\nEfficient & Easy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Increase your work management & career\ndevelopment radically",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),


                  const Spacer(),

                  ElevatedButton(
                    onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SigninWithEmail(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3649C3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Sign In",style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF3649C3),
                      side: const BorderSide(color: Color(0xFF3649C3)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF3649C3),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBox(String path, double width, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
