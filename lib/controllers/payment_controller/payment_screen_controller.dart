import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedCardIndex = 0.obs;
  var selectedAddressIndex = 0.obs;

  void selectCard(int index) {
    selectedCardIndex.value = index;
  }

  void selectAddress(int index) {
    selectedAddressIndex.value = index;
  }
}
