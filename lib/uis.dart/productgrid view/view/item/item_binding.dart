
import 'package:get/get.dart';

import '../../item_controller.dart';

class ItemBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ItemController(),permanent:false);
    Get.create(() => ItemController());
  }
}