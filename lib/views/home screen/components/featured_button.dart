import 'package:e_commerce_app/consts/consts.dart';

Widget featuredButton({image, title}) {
  return Row(
    children: [
      Image.asset(image, width: 60, fit: BoxFit.fill),
      10.widthBox,
      "$title".text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .width(200)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .outerShadowSm
      .make();
}
