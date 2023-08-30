import 'dart:io';

import 'package:e_commerce_app/common%20widgets/bg_widget.dart';
import 'package:e_commerce_app/common%20widgets/custom_button.dart';
import 'package:e_commerce_app/common%20widgets/custom_textfield.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/profile_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor),
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.profileImagePath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                : Image.file(
                    File(controller.profileImagePath.value),
                    width: 80,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            customButton(
                title: "Change",
                color: redColor,
                textColor: Colors.white,
                onPress: () {
                  controller.ChangeProfile(context);
                }),
            Divider(),
            20.heightBox,
            customTextField(
              title: name,
              hint: hintName,
            ),
            customTextField(
                title: password, hint: hintPassword, hideText: true),
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: customButton(
                  title: "Save",
                  color: redColor,
                  textColor: whiteColor,
                  onPress: () {}),
            )
          ],
        )
            .box
            .shadowSm
            .white
            .padding(EdgeInsets.all(16))
            .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
