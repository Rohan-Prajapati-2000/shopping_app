import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/image_text_widget/horizontal_image_text.dart';
import 'package:shoping_app/common/widgets/shimmers/category_shimmer.dart';
import 'package:shoping_app/features/shop/controllers/category_controller.dart';
import 'package:shoping_app/features/shop/screens/sub_category/sub_category.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.put(CategoryController());

    return Obx(() {
      if(categoriesController.isLoading.value) return SCategoryShimmer();

      if(categoriesController.featuredCategories.isEmpty){
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoriesController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categoriesController.featuredCategories[index];

                return SHorizontalImageText(
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(() => const SubCategoriesScreen()));
              },
            ),
          );
        }
    );
  }
}