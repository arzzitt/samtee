
import 'package:get/get.dart';

import '../../category_controller.dart';


class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CategoryController(),permanent:false);
    Get.create(() => CategoryController());
  }
}