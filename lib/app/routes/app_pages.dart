// @dart=2.9
import 'package:get/get.dart';

import 'package:simpli_till_test/app/modules/basket/bindings/basket_binding.dart';
import 'package:simpli_till_test/app/modules/basket/views/basket_view.dart';
import 'package:simpli_till_test/app/modules/home/bindings/home_binding.dart';
import 'package:simpli_till_test/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BASKET,
      page: () => BasketView(),
      binding: BasketBinding(),
    ),
  ];
}
