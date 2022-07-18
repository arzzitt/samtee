import 'package:flutter/material.dart';

import '../apis/Access.dart';
import '../models/allCategoryList.dart';

import '../storage.dart';

class categoryListComplete extends StatefulWidget {
  const categoryListComplete({Key? key}) : super(key: key);

  @override
  State<categoryListComplete> createState() => _categoryListCompleteState();
}

class _categoryListCompleteState extends State<categoryListComplete> {
  List<AllCategoryList> allCategList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    access().categoriesList1().then((value) async {
      setState(() {
        for (Map i in value.data) {
          allCategList.add(AllCategoryList.fromJson(i));
        }

        print("all categories: $allCategList");
        print(allCategList.length);
      });
    });

    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB67A4F),
        elevation: 0,
        title: Text("Categories"),
      ),
      body: SingleChildScrollView(
        child: loading
            ? Center(child: CircularProgressIndicator(color: Color(0xffB67A4F)))
            : Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 0),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (_, index) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 125,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffB67A4F).withOpacity(0.5),
                                // image: DecorationImage(
                                //   image: NetworkImage(categList[index].image.toString())
                                // ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(allCategList[index].name.toString())
                          ],
                        ),
                      ),
                      itemCount: allCategList.length,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
