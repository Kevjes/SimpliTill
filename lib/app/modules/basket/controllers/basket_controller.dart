// @dart=2.9

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/models/my_item_model.dart';

class BasketController extends GetxController {
  //TODO: Implement BasketController

  final basketItems = <MyItemModel>[].obs;
  GetStorage box = GetStorage();

  final currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final data = box.read("basket");
    if (data != null) {
      for (var item in data) {
        basketItems.add(MyItemModel.fromJson(item));
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addItem(MyItemModel item) {
    if (!basketItems.contains(item)) {
      basketItems.add(item);
      box.write("basket", basketItems);
      print(box.getValues());
    }
  }
  void updateItem(){
   box.write("basket", basketItems);

  }
}
