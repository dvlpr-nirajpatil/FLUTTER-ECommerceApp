import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/common%20widgets/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controllers/profile_controller.dart';
import 'package:e_commerce_app/services/firestore_service.dart';
import 'package:e_commerce_app/views/auth%20screens/login_screen.dart';
import 'package:e_commerce_app/views/profile%20screen/edit_profile_screen.dart';
import 'package:e_commerce_app/views/profile%20screen/info_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(user!.uid),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var document = snapshot.data!.docs[0];

              return SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Align(
                        heightFactor: 0.5,
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => EditProfile());
                            },
                            icon: Icon(
                              Icons.edit,
                              color: whiteColor,
                            )),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            controller.profileImagePath.isEmpty
                                ? Image.asset(
                                    imgProfile2,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.file(
                                    File(controller.profileImagePath.value),
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                            10.widthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${document["name"]}"
                                      .text
                                      .white
                                      .fontFamily(semibold)
                                      .make(),
                                  5.heightBox,
                                  "${document["email"]}".text.white.make()
                                ],
                              ),
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.white)),
                                onPressed: () async {
                                  try {
                                    await auth.signOut().then((value) =>
                                        Get.offAll(() => LoginScreen()));
                                  } catch (e) {}
                                },
                                child: "Logout"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make())
                          ],
                        )
                            .box
                            .padding(EdgeInsets.symmetric(horizontal: 12))
                            .make(),
                      ),
                      25.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoButton(
                              value: document["cart_count"],
                              title: "in your cart",
                            ),
                            InfoButton(
                              value: document["wishlist_count"],
                              title: "in your wishlist",
                            ),
                            InfoButton(
                              value: document["order_count"],
                              title: "your orders",
                            ),
                          ]).paddingSymmetric(horizontal: 16).box.make(),
                      Column(children: [
                        20.heightBox,
                        ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      leading: Image.asset(
                                        profileButtonIconsList[index],
                                        color: fontGrey,
                                        width: 22,
                                      ),
                                      title: profileButtonList[index]
                                          .text
                                          .bold
                                          .color(darkFontGrey)
                                          .make());
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemCount: profileButtonList.length)
                            .box
                            .white
                            .rounded
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .make(),
                      ]).box.padding(EdgeInsets.all(12)).color(redColor).make(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
