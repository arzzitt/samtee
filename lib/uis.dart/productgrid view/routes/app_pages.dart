
import 'package:get/get.dart';
import 'package:login_flow/uis.dart/categoryGrid%20view/view/item/category_binding.dart';
import '../../categoryGrid view/view/item/category_screen.dart';
import '../view/item/item_binding.dart';
import '../view/item/item_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.ITEM,
      page: () => ItemScreen(),
      binding: ItemBinding(),
    ),
    GetPage(
      name: AppRoutes.CATEGORY,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
  ];
}
