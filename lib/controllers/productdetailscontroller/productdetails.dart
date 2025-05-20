// import 'package:get/get.dart';
//
// class ProductController extends GetxController {
//   RxInt selectedTab = 0.obs;
//   RxBool showMore = false.obs;
//
//   void changeTab(int index) => selectedTab.value = index;
//   void toggleMore() => showMore.toggle();
// }

import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var selectedTab = 0.obs;
  var showMore = false.obs;

  final String description =
      'The technology with two noise sensors and two microphones on each ear cup detects ambient noise and sends the data to the HD noise minimization processor QN1. Using a new algorithm, the QN1 then processes and minimizes noise for different acoustic environments in real time. Together with a new Bluetooth Audio SoC and advanced audio signal processing, the result is truly remarkable.';

  void toggleShowMore() {
    showMore.value = !showMore.value;
  }

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
