import 'package:e_commerce_app/common%20widgets/custom_button.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  String title;

  ProductDetails({super.key, required this.title});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: widget.title.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline_outlined,
            ),
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SwiperSection

                  VxSwiper.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgPi1,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        );
                      }),

                  // title and description Section
                  10.heightBox,
                  widget.title.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,

                  //Rating Section

                  VxRating(
                    onRatingUpdate: (value) {},
                    selectionColor: golden,
                    normalColor: textfieldGrey,
                    count: 5,
                    stepInt: true,
                    size: 25,
                  ),
                  10.heightBox,
                  "\$30,000"
                      .text
                      .color(redColor)
                      .size(18)
                      .fontFamily(bold)
                      .make(),

                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller"
                              .text
                              .color(whiteColor)
                              .fontFamily(semibold)
                              .make(),
                          5.heightBox,
                          "In house product".text.fontFamily(semibold).make()
                        ],
                      )),
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(
                          Icons.message,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .color(textfieldGrey)
                      .height(60)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .make(),

                  20.heightBox,

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(textfieldGrey).make(),
                          ),
                          Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(40, 40)
                                      .roundedFull
                                      .margin(
                                          EdgeInsets.symmetric(horizontal: 4))
                                      .color(Vx.randomColor)
                                      .make())),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity ".text.color(textfieldGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {
                                  qty > 1
                                      ? setState(() {
                                          qty--;
                                        })
                                      : null;
                                },
                                icon: Icon(Icons.remove)),
                            qty.text.make(),
                            IconButton(
                                onPressed: () {
                                  qty++;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add)),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGrey).make()
                          ]),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child:
                                "Total price".text.color(textfieldGrey).make(),
                          ),
                          "\$0.00"
                              .text
                              .fontFamily(bold)
                              .size(16)
                              .color(redColor)
                              .make(),
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(8))
                          .height(50)
                          .color(lightGolden)
                          .make(),
                      15.heightBox
                    ],
                  ).box.white.outerShadowSm.roundedSM.make(),

                  10.heightBox,
                  "Description"
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  "this is the dummy item and dummy description"
                      .text
                      .color(darkFontGrey)
                      .make(),

                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        itemDetailsList.length,
                        (index) => ListTile(
                              title: itemDetailsList[index].text.make(),
                              trailing: Icon(Icons.arrow_forward),
                            )),
                  ),
                  10.heightBox,
                  productYouLike.text
                      .size(16)
                      .fontFamily(bold)
                      .color(darkFontGrey)
                      .make(),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "Laptop 4GB/16GB"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  10.heightBox,
                                  "\$600"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make()
                                ],
                              )
                                  .box
                                  .white
                                  .roundedSM
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .padding(EdgeInsets.all(8))
                                  .make()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: customButton(
              title: "Add to cart", color: redColor, textColor: whiteColor),
        )
      ]),
    );
  }
}
