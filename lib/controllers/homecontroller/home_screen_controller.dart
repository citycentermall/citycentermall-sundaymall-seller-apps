import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentSlider = 0.obs;
  RxBool isSearching = false.obs;

  late PageController pageController;
  late Timer timer;

  final List<String> sliderImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (currentSlider.value < sliderImages.length - 1) {
        currentSlider.value++;
      } else {
        currentSlider.value = 0;
      }
      pageController.animateToPage(
        currentSlider.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    timer.cancel();
    super.onClose();
  }

  void toggleSearch(bool value) {
    isSearching.value = value;
  }
}
