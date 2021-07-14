// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/models/my_item_model.dart';

class MyItemWidget extends StatelessWidget {
  final MyItemModel item;
  const MyItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(this.item.image), fit: BoxFit.cover),
            ),
          )),
          Container(
            width: Get.width,
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  this.item.title,
                  style: TextStyle(
                      color: Config.colors.greyTextColor, fontSize: 16),
                ),
                Text(
                  this.item.price.toString() + " CFA",
                  style: TextStyle(
                      color: Config.colors.greyTextColor2, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
