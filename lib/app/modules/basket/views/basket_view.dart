// @dart=2.9
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/modules/basket/views/basket_first_view.dart';

import '../controllers/basket_controller.dart';

class BasketView extends GetView<BasketController> {
  BasketController basketController = Get.put(BasketController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Tickets".toUpperCase(),
            style: TextStyle(color: Config.colors.blue, fontSize: 14),
          ),
          centerTitle: true,
          elevation: .0,
          bottom: TabBar(
              onTap: (index) {
                basketController.currentPage(index);
              },
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
              indicatorWeight: 3,
              tabs: [
                Obx(() => Tab(
                      child: Text(
                        "en cours".toUpperCase(),
                        style: TextStyle(
                            color: basketController.currentPage.value == 0
                                ? Config.colors.greyTextColor
                                : Config.colors.greyTextColor2,
                            fontSize: 13),
                      ),
                    )),
                Obx(() => Tab(
                      child: Text(
                        "en attente".toUpperCase(),
                        style: TextStyle(
                            color: basketController.currentPage.value == 1
                                ? Config.colors.greyTextColor
                                : Config.colors.greyTextColor2,
                            fontSize: 13),
                      ),
                    )),
              ]),
        ),
        body: TabBarView(children: [
          BasketFirstView(),
          Center(
            child: Text("1"),
          ),
        ]),
      ),
    );
  }
}
