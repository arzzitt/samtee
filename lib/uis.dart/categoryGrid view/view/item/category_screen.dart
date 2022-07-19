import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../productgrid view/size_config.dart';

import 'components/category_gridview.dart';
class CategoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(child: CategoryGridView()),
    );
  }
}

