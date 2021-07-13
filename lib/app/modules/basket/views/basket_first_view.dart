// @dart=2.9
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/modules/basket/controllers/basket_controller.dart';
import 'package:simpli_till_test/app/widgets/basket_widget.dart';
import 'package:simpli_till_test/app/widgets/my_button.dart';

class BasketFirstView extends GetView {
  BasketController basketController = Get.put(BasketController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: basketController.basketItems.length,
                  itemBuilder: (_, i) {
                    return BasketWidget(
                      item: basketController.basketItems[i],
                      onChange: (a) {
                        basketController.basketItems[i].qte = a;
                        basketController.updateItem();
                      },
                    );
                  }))),
          Container(
            height: 250,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total".toUpperCase()),
                    Text("2000"),
                  ],
                ),
                Divider(),
                MyCustomButton(
                  title: "Mettre le ticket en attente".toUpperCase(),
                  backgroundColor: Colors.white,
                  titleColor: Config.colors.greyTextColor,
                  suffixIcon: Icons.pause,
                  elevation: .0,
                  onTap: () {},
                ),
                Divider(height: 0),
                MyCustomButton(
                  title: "Annuler le ticket".toUpperCase(),
                  titleColor: Config.colors.red,
                  backgroundColor: Colors.white,
                  suffixIcon: Icons.close,
                  elevation: .0,
                  onTap: () {},
                ),
                Divider(height: 0),
                Container(
                  height: 45,
                  child: MyCustomButton(
                    title: "PAYER",
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
