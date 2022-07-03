
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../item_controller.dart';
import 'item_found_card.dart';
import 'item_loading_card.dart';

class ItemGridView extends StatefulWidget {
  const ItemGridView( {Key? key,required this.category}) : super(key: key);
  final int category;

  @override
  _ItemGridViewState createState() => _ItemGridViewState();
}

class _ItemGridViewState extends State<ItemGridView> {
  ScrollController scrollController = ScrollController();
  int page=0;

  @override
  void initState() {

    super.initState();
    print("CAT ID grid:${widget.category}");

    Get.find<ItemController>()
        .fetchItem(++page,widget.category);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          Get.find<ItemController>().itemList.length % 10 == 0) {
        Get.find<ItemController>()
            .addItem(++page,widget.category);
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    //Get.find<ItemController>().isLoading(true);

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<ItemController>().isLoading.value) {
        return GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount:  5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.6),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: index % 2 == 0 ? 10 : 10,
                      right: index % 2 == 0 ? 5 : 20,
                      left: index % 2 == 1 ? 5 : 20,
                      bottom: index % 2 == 1 ? 10 : 10),
                  child: ItemLoadingCard());
            });
      } else {
        return RefreshIndicator(
          onRefresh: () async {
            Get.find<ItemController>().fetchItem(1,widget.category);
            setState((){
              page=1;
            });

          },
          child: GridView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: Get.find<ItemController>().isAddLoading.value
                  ? Get.find<ItemController>().itemList.length + 4
                  : Get.find<ItemController>().itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (BuildContext context, int index) {
                if (Get.find<ItemController>().itemList.length <= index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: index % 2 == 0 ? 10 : 10,
                          right: index % 2 == 0 ? 5 : 20,
                          left: index % 2 == 1 ? 5 : 20,
                          bottom: index % 2 == 1 ? 10 : 10),
                      child: ItemLoadingCard()
                  );
                }
                return Padding(
                    padding: EdgeInsets.only(
                        top: index % 2 == 0 ? 10 : 10,
                        right: index % 2 == 0 ? 5 : 20,
                        left: index % 2 == 1 ? 5 : 20,
                        bottom: index % 2 == 1 ? 10 : 10),
                    child:
                        ItemCard(Get.find<ItemController>().itemList[index]));
              }),
        );
      }
    });
  }
}
