import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../productgrid view/constants.dart';
import '../../../../productgrid view/size_config.dart';



class CategoriesLoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),

      child: Shimmer.fromColors(
        highlightColor: kBackgroundColor,
        baseColor: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Flexible(
              flex: 2,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                  ),
                  width: getProportionateScreenWidth(100),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Flexible(

              child: Container(width: getProportionateScreenWidth(110),
                height: getProportionateScreenHeight(10),
                color: Colors.grey[400],
              ),
            )
          ],
        ),
      ),
    );
  }
}