import 'package:e_commerce_app/consts/consts.dart';

Widget customButton({title, onPress, textColor, color}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: EdgeInsets.all(12)),
      onPressed: () {
        onPress();
      },
      child: "$title".text.color(textColor).fontFamily(bold).make());
}
