import 'package:e_commerce_app/common%20widgets/bg_widget.dart';
import 'package:e_commerce_app/views/categories%20screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  String? categoryName;
  CategoryDetails({super.key, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: "$categoryName".text.fontFamily(bold).make(),
        ),
        body: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    children: List.generate(
                        4,
                        (index) => "Baby Clothing"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make()
                            .box
                            .outerShadow
                            .alignCenter
                            .roundedSM
                            .padding(EdgeInsets.all(12))
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .white
                            .make()),
                  ),
                ),
              ),
              15.heightBox,
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: lightGrey,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 230,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgPi1,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          10.heightBox,
                          "iPhone 11 Pro Max"
                              .text
                              .size(14)
                              .color(fontGrey)
                              .fontFamily(semibold)
                              .make(),
                          8.heightBox,
                          "\$1200".text.fontFamily(bold).color(redColor).make()
                        ],
                      )
                          .box
                          .white
                          .padding(EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10))
                          .roundedSM
                          .make()
                          .onTap(() {
                        Get.to(() => ProductDetails(
                              title: "iPhone 11 Pro Max",
                            ));
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
