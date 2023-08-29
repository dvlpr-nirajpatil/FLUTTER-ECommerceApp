import 'package:e_commerce_app/common%20widgets/bg_widget.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/categories%20screen/category_details.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: category.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      categoryImagesList[index],
                      height: 130,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    categoryTitleList[index]
                        .text
                        .align(TextAlign.center)
                        .color(darkFontGrey)
                        .make()
                  ],
                )
                    .box
                    .white
                    .padding(EdgeInsets.symmetric(horizontal: 4))
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadow
                    .make()
                    .onTap(() {
                  Get.to(() => CategoryDetails(
                        categoryName: categoryTitleList[index],
                      ));
                });
              }),
        ),
      ),
    );
  }
}
