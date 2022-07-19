import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/models/allCategoryList.dart';
import 'package:login_flow/uis.dart/productgrid%20view/routes/app_routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../models/CategoriesList.dart';
import '../../../../../models/carouselProducts.dart';
import '../../../../product_description.dart';
import '../../../../productgrid view/constants.dart';
import '../../../../productgrid view/item_controller.dart';
import '../../../../productgrid view/size_config.dart';
import '../../../category_controller.dart';


class CategoryCard extends StatelessWidget {
  CategoryCard(this.category);
  final CategoriesList category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.ITEM,arguments: category.id)!.then((value) => Get.delete<ItemController>());
      },
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

          // mainAxisSize: MainAxisSize.max,

          children: [
            Flexible(
              flex: 2,
              child:category.image==null?Shimmer.fromColors(
                highlightColor: kBackgroundColor,
                baseColor: Colors.grey,
                child: Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[400],

                    ),


                  ),
                ),): Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[400],

                ),
                child: Hero(
                  tag: "tagHero${category.id}",
                  child: Image.network(
                    category!.image!.src.toString()??"",
                    fit: BoxFit.fill,
                    height: getProportionateScreenHeight(150),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),

            Flexible(

              child: Container(
                  child: Text(
                    "${this.category.name}",textAlign:TextAlign.center,
                    style: TextStyle(

                        color: kPrimaryColor,
                        ),
                    maxLines: 2,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
