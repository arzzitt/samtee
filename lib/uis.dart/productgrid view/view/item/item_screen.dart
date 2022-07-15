import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../size_config.dart';
import 'components/item_gridview.dart';
class ItemScreen extends StatelessWidget {

  int category=Get.arguments;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ItemGridView(category:category),
    );
  }
}

