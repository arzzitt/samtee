import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/carouselProducts.dart';
import '../../../../product_description.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ItemCard extends StatelessWidget {
  ItemCard(this.item);
  final CarouselProducts item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PD(
            product_id:
            this.item.id!
        ));
      },
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 8,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Hero(
                    tag: "tagHero${item.id}",
                    child: Image.network(
                      item.images1![0].src.toString()??"",
                      fit: BoxFit.fill,
                      height: getProportionateScreenHeight(150),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Flexible(
              flex: 3,
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${this.item.name}",
                          style: TextStyle(

                              color: kPrimaryColor,
                              fontSize: getProportionateScreenWidth(20)),
                          maxLines: 2,
                        ),
                        Text(
                          "${this.item.stockStatus}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                              fontSize: 10),
                          maxLines: 1,
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: 10, bottom: 5),
                            child: this.item.price != null
                                ? Text(
                              "\$ ${this.item.price.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize:getProportionateScreenWidth(15) ),
                              maxLines: 1,
                            )
                                : Container()),

                      ])),
            )
          ],
        ),
      ),
    );
  }
}
