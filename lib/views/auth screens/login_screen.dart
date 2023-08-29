import 'package:e_commerce_app/common%20widgets/app_logo_widget.dart';
import 'package:e_commerce_app/common%20widgets/bg_widget.dart';
import 'package:e_commerce_app/common%20widgets/custom_button.dart';
import 'package:e_commerce_app/common%20widgets/custom_textfield.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:e_commerce_app/views/auth%20screens/signup_screen.dart';
import 'package:e_commerce_app/views/home%20screen/home.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/consts/consts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var controller = Get.put(AuthController());

  var emailFieldController = TextEditingController();
  var passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogo(),
              10.heightBox,
              "Login to $appname".text.white.fontFamily(bold).size(18).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        title: email,
                        hint: hintEmail,
                        controller: emailFieldController),
                    customTextField(
                        hideText: true,
                        title: password,
                        hint: hintPassword,
                        controller: passwordFieldController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPass.text.make(),
                      ),
                    ),
                    5.heightBox,
                    controller.is_loading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : customButton(
                                onPress: () async {
                                  controller.is_loading(true);
                                  try {
                                    await controller
                                        .loginMethod(
                                            email: emailFieldController.text,
                                            password:
                                                passwordFieldController.text,
                                            context: context)
                                        .then((value) {
                                      if (value != null) {
                                        VxToast.show(context,
                                            msg: loginMessage);
                                        Get.offAll(() => Home());
                                      } else {
                                        controller.is_loading(false);
                                      }
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    print(e);
                                    VxToast.show(context,
                                        msg: e.toString(), showTime: 3000);
                                  }
                                },
                                title: signin,
                                color: redColor,
                                textColor: whiteColor)
                            .box
                            .width(context.screenWidth - 50)
                            .make(),
                    5.heightBox,
                    createNew.text.color(fontGrey).make(),
                    5.heightBox,
                    customButton(
                            onPress: () {
                              Get.to(() => SignUpScreen());
                            },
                            title: signup,
                            color: lightGolden,
                            textColor: redColor)
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    10.heightBox,
                    loginwith.text.color(fontGrey).make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          socialIcons.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  radius: 25,
                                  child: Image(
                                    image: AssetImage(
                                      socialIcons[index],
                                    ),
                                    width: 30,
                                  ),
                                ),
                              )),
                    )
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .shadowSm
                    .width(context.screenWidth - 70)
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
