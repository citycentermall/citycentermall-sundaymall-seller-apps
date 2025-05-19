import 'package:get/get.dart';

class CardController extends GetxController {
  var isDefault = false.obs;

  void toggleDefault(bool? value) {
    isDefault.value = value ?? false;
  }
}
