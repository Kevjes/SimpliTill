import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final isMobile = Get.width < 700 ? true.obs : false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
