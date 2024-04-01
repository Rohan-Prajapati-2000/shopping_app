import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/image_text_widget/horizontal_image_text.dart';
import 'package:shoping_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SHorizontalImageText(image: SImage.shoesIcon, title: "Shoes", onTap: () => Get.to(()=> SubCategoriesScreen()));
        },
      ),
    );
  }
}