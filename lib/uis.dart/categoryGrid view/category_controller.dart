
import 'package:get/get.dart';

import '../../apis/Access.dart';
import '../../models/CategoriesList.dart';
import '../../models/CategoriesList.dart';
import '../../models/carouselProducts.dart';

class CategoryController extends GetxController{
  var isLoading = true.obs;
  var isAddLoading = false.obs;
  var totalProducts=0.obs;
   var category=0.obs;

  var itemList = List<CategoriesList>.empty(growable: true).obs;


  @override
  void onInit() {

    super.onInit();
    print("CAT ID contro:${category.value}");
    //fetchItem(1,category.value);
  }


  void fetchItem(int start) async {
    try{
      isLoading(true);
      print("Loading:${isLoading.value}");
      itemList.clear();
      await access().categoriesList1(start).then((value) async {


          for (Map i in value.data) {
            itemList.add(CategoriesList.fromJson(i));

          }
          totalProducts(int.parse(value.headers.value("X-WP-Total")));


          print("Loading:${isLoading.value}");







      });

    }


    finally{
      isLoading(false);
      print("Loading:${isLoading.value}");
    }
  }

  void addItem(int start) async {
    try{
      isAddLoading(true);
      print("Adding:${isAddLoading.value}");
     await  access().categoriesList1(start).then((value) async {


        for (Map i in value.data) {
          itemList.add(CategoriesList.fromJson(i));
        }
        print("Loading:${isLoading.value}");
        print("Adding:${isAddLoading.value}");
        totalProducts(value.headers.value("X-WP-Total"));







      });
    }
    finally{
      itemList.length==totalProducts.value?
      isAddLoading(false):isAddLoading(true);
      print("Loading:${isLoading.value}");
      print("Adding:${isAddLoading.value}");
    }
  }
}