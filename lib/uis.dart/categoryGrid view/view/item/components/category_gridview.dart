
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flow/uis.dart/categoryGrid%20view/category_controller.dart';


import 'categories_found_card.dart';
import 'categories_loading_card.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView( {Key? key,}) : super(key: key);


  @override
  _CategoryGridViewState createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  ScrollController scrollController = ScrollController();
  int page=0;

  @override
  void initState() {

    super.initState();


    Get.find<CategoryController>()
        .fetchItem(++page);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          Get.find<CategoryController>().itemList.length % 10 == 0) {
        Get.find<CategoryController>()
            .addItem(++page);
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    //Get.find<CategoryController>().isLoading(true);

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<CategoryController>().isLoading.value) {
        return GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount:  5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, ),
            itemBuilder: (BuildContext context, int index) {
              return CategoriesLoadingCard();
            });
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().fetchItem(1);
            setState((){
              page=1;
            });

          },
          child: GridView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: Get.find<CategoryController>().isAddLoading.value
                  ? Get.find<CategoryController>().itemList.length + 4
                  : Get.find<CategoryController>().itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,childAspectRatio: 1,crossAxisSpacing: 10,mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                if (Get.find<CategoryController>().itemList.length <= index) {
                  return CategoriesLoadingCard();
                }
                return CategoryCard(Get.find<CategoryController>().itemList[index]);
              }),
        );
      }
    });
  }
}
