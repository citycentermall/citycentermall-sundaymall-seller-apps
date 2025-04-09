import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../widgets/gradient_button.dart';
import 'final_onboad.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController(viewportFraction: 0.75);
  int currentIndex = 0;
  late Timer _timer;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": "assets/images/on_first_image.png",
      "title": "Simplify Bulk Purchases with SundayMalls!",
      "subtitle":
      "Streamline your buying process and access exclusive deals with trusted suppliers — all in one place.",
    },
    {
      "image": "assets/images/on_second_image.png",
      "title": "Bulk Buying Made Easy – Start Today!",
      "subtitle":
      "Save time, money, and effort with seamless bulk ordering and personalized supplier connections.",
    },
    {
      "image": "assets/images/on_fourth_image.png",
      "title": "Empower Your Business with SundayMalls!",
      "subtitle":
      "Boost efficiency, reduce costs, and grow your business with our powerful bulk buying platform.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int nextPage = (currentIndex + 1) % onboardingData.length;
      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.55,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double value = 1.0;
                    if (controller.position.haveDimensions) {
                      value = controller.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
                    }
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, left: 6, right: 6, bottom: 12),
                        height: screenHeight * 0.26,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          onboardingData[index]['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );


                  },
                );
              },
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    onboardingData[currentIndex]['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    onboardingData[currentIndex]['subtitle'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const Spacer(),
                  const SizedBox(height: 50),
                  SmoothPageIndicator(
                    controller: controller,
                    count: onboardingData.length,
                    effect: const WormEffect(
                      activeDotColor: Color(0xFFFF6600),
                      dotHeight: 3,
                      dotWidth: 20,
                    ),
                  ),

                  const SizedBox(height: 24),
                  GradientButton(
                    text:    currentIndex == onboardingData.length - 1
                        ? "Next"
                        : "Next",
                       backgroundColor: Color(0xFFFF6600),
                    onPressed: () {
                      if (currentIndex == onboardingData.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FinalOnboardingScreen()),
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinalOnboardingScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFF6600),
                      side: const BorderSide(color: Color(0xFFFF6600)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Skip",style: TextStyle(
                      color: Colors.orange,
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



