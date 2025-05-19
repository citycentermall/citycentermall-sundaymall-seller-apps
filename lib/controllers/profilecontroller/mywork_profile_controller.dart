import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyWorkProfileController extends GetxController {
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxnString selectedBusinessType = RxnString();
  TextEditingController addressController = TextEditingController();

  final List<String> businessTypes = [
    'Retail',
    'Wholesale',
    'Services',
    'Manufacturing',
    'Other',
  ];

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateBusinessType(String? value) {
    selectedBusinessType.value = value;
  }

  @override
  void onClose() {
    addressController.dispose();
    super.onClose();
  }
}
