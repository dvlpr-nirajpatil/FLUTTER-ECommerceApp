import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controllers/home_screen_controller.dart';
import 'package:e_commerce_app/views/cart%20screen/cart_screen.dart';
import 'package:e_commerce_app/views/categories%20screen/category_screen.dart';
import 'package:e_commerce_app/views/home%20screen/home_screen.dart';
import 'package:e_commerce_app/views/profile%20screen/profile_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var controller = Get.put(HomeScreenController());

  var navBarItems = [
    BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
        label: category),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26,
        ),
        label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: account),
  ];

  var navBody = [HomeScreen(), CategoryScreen(), CartScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentScreenIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(color: redColor, fontFamily: semibold),
          items: navBarItems,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentScreenIndex.value = value;
          },
        ),
      ),
      body: Obx(() => navBody[controller.currentScreenIndex.value]),
    );
  }
}
