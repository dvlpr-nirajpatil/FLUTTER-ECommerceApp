import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import '../../common widgets/app_logo_widget.dart';
import '../../common widgets/bg_widget.dart';
import '../../common widgets/custom_button.dart';
import '../../common widgets/custom_textfield.dart';
import '../home screen/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());

  //textfield controller

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();

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
              "Join the $appname".text.white.fontFamily(bold).size(18).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        title: name,
                        hint: hintName,
                        controller: nameController),
                    customTextField(
                        title: email,
                        hint: hintEmail,
                        controller: emailController),
                    customTextField(
                        title: password,
                        hint: hintPassword,
                        controller: passwordController),
                    customTextField(
                        title: retypePassword,
                        hint: hintPassword,
                        controller: retypePasswordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgetPass.text.make(),
                      ),
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          activeColor: whiteColor,
                          checkColor: redColor,
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          },
                        ),
                        5.widthBox,
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey),
                                ),
                                TextSpan(
                                  text: termsAndConditions,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor),
                                ),
                                TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                      fontFamily: bold, color: fontGrey),
                                ),
                                TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      fontFamily: bold, color: redColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    5.heightBox,
                    controller.is_loading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : customButton(
                                onPress: () async {
                                  controller.is_loading(true);
                                  if (isChecked == true) {
                                    try {
                                      await controller
                                          .signupMethod(
                                              context: context,
                                              email: emailController.text,
                                              password: passwordController.text)
                                          .then((value) {
                                        return controller.storeUserData(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }).then((value) {
                                        VxToast.show(context,
                                            msg: loginMessage);
                                        Get.offAll(() => Home());
                                      });
                                    } catch (e) {
                                      controller.is_loading(false);
                                      auth.signOut();
                                      VxToast.show(context, msg: e.toString());
                                    }
                                  }
                                },
                                title: signup,
                                color: isChecked! ? redColor : lightGrey,
                                textColor: whiteColor)
                            .box
                            .width(context.screenWidth - 50)
                            .make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        alreadyAccount.text.make(),
                        signin.text.color(redColor).make().onTap(() {
                          Get.back();
                        }),
                      ],
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
