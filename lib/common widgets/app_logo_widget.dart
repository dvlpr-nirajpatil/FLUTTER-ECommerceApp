import 'package:e_commerce_app/consts/consts.dart';

Widget appLogo() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(70, 70)
      .padding(EdgeInsets.all(7))
      .rounded
      .make();
}
