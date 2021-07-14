// @dart=2.9
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/models/category_model.dart';
import 'package:simpli_till_test/app/models/my_item_model.dart';
import 'package:simpli_till_test/app/modules/basket/controllers/basket_controller.dart';
import 'package:simpli_till_test/app/modules/basket/views/basket_view.dart';
import 'package:simpli_till_test/app/routes/app_pages.dart';
import 'package:simpli_till_test/app/widgets/category.dart';
import 'package:simpli_till_test/app/widgets/my_button.dart';
import 'package:simpli_till_test/app/widgets/my_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  BasketController basketController = Get.put(BasketController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 100,
          backgroundColor: Config.colors.appBarColor,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image.asset(Config.assets.icon, width: 40),
          ),
          actions: [
            if (!homeController.isMobile.value)
              CircleAvatar(
                backgroundImage: AssetImage(Config.assets.profil),
                radius: 17,
              ),
            SizedBox(width: 20),
            if (!homeController.isMobile.value)
              Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MyCustomButton(
                    preffixIcon: Icons.close,
                    title: "Fermer la caisse",
                    backgroundColor: Config.colors.red,
                    onTap: () {},
                  )),
            if (homeController.isMobile.value)
              Container(
                  height: 45,
                  width: 45,
                  child: Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.BASKET);
                          },
                          icon: Icon(Icons.shop)),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Config.colors.red,
                            child: Obx(() => Text(
                                basketController.basketItems.length.toString(),
                                style: TextStyle(color: Colors.white))),
                          ))
                    ],
                  )),
            SizedBox(width: 20),
          ],
        ),
        body: Row(
          children: [
            Visibility(
              visible: !homeController.isMobile.value,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      child: CategoryWidgetBuilder(
                        categories: [
                          CategoryModel(title: "Légumes"),
                          CategoryModel(
                              title: "téléphones", image: Config.assets.profil),
                          CategoryModel(title: "Electronique"),
                          CategoryModel(
                              title: "Légumes", image: Config.assets.profil),
                          CategoryModel(title: "chaussures"),
                          CategoryModel(
                              title: "Patates", image: Config.assets.profil),
                          CategoryModel(title: "Voitures"),
                          CategoryModel(
                              title: "Légumes", image: Config.assets.profil),
                          CategoryModel(title: "Légumes"),
                        ],
                        onChange: (i) {},
                      ),
                    ),
                  ),
                  Container(
                      height: 80,
                      width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Config.colors.blue,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ))))
                ],
              ),
            ),
            Expanded(
                child: Container(
                    color: Config.colors.background,
                    padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: homeController.isMobile.value,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  child: CategoryWidgetBuilder(
                                    categories: [
                                      CategoryModel(title: "Légumes"),
                                      CategoryModel(
                                          title: "téléphones",
                                          image: Config.assets.profil),
                                      CategoryModel(title: "Electronique"),
                                      CategoryModel(
                                          title: "Légumes",
                                          image: Config.assets.profil),
                                      CategoryModel(title: "chaussures"),
                                      CategoryModel(
                                          title: "Patates",
                                          image: Config.assets.profil),
                                      CategoryModel(title: "Voitures"),
                                      CategoryModel(
                                          title: "Légumes",
                                          image: Config.assets.profil),
                                      CategoryModel(title: "Légumes"),
                                    ],
                                    onChange: (i) {},
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Config.colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 14,
                                          ))))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: homeController.isMobile.value ? 0 : 150),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Config.colors.greyTextColor2,
                              ),
                              suffixIcon: Icon(
                                Icons.qr_code,
                                color: Config.colors.blue,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText:
                                  "Rechercher un produit par son nom, code,...",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text("Légumes",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Config.colors.greyTextColor)),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: GridView.builder(
                              itemCount: 30,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 220,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (_, i) {
                                var item = MyItemModel(
                                  image: Config.assets.profil,
                                  title: "Légumes Africaines",
                                  price: 200 * (i + 1),
                                );
                                return Card(
                                    child: InkWell(
                                        onTap: () =>
                                            basketController.addItem(item),
                                        child: MyItemWidget(item: item)));
                              }),
                        ),
                      ],
                    ))),
            Visibility(
              visible: !homeController.isMobile.value,
              child: Container(
                width: 300,
                child: BasketView(),
              ),
            ),
          ],
        ));
  }
}
