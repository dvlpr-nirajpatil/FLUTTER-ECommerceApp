import 'package:e_commerce_app/consts/consts.dart';

Widget homeButton({width, height, icon, title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      15.heightBox,
      "$title"
          .text
          .color(darkFontGrey)
          .align(TextAlign.center)
          .fontFamily(semibold)
          .make()
    ],
  ).box.rounded.white.shadowSm.size(width, height).make();
}
