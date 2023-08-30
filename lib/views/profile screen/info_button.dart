import '../../consts/consts.dart';

class InfoButton extends StatelessWidget {
  var title;
  var value;

  InfoButton({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "$value".text.make(),
        5.heightBox,
        Expanded(child: "$title".text.center.make())
      ],
    ).box.size(110, 70).white.rounded.padding(EdgeInsets.all(12)).make();
  }
}
