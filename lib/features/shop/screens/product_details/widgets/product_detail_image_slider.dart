import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import 'package:shoping_app/common/widgets/icons/s_circular_icon.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/features/shop/controllers/product/image_controller.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return SCurvedEdgeWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.productImageRadius * 2),
                child: Center(child: Obx(
                  () {
                    final image = controller.selectProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: SColors.primaryColor),
                      ),
                    );
                  },
                )),
              ),
            ),

            /// IMAGE SLIDER
            Positioned(
              right: 0,
              bottom: 30,
              left: SSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: images.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: SSizes.spaceBtwItems),
                    itemBuilder: (_, index) => Obx(() {
                          final imageSelected =
                              controller.selectProductImage.value ==
                                  images[index];
                          return SRoundedImage(
                              width: 80,
                              height: 80,
                              isNetworkImage: true,
                              imageUrl: images[index],
                              onPressed: () => controller
                                  .selectProductImage.value = images[index],
                              border: Border.all(
                                  color: imageSelected
                                      ? SColors.primaryColor
                                      : Colors.transparent),

                              /// Set border width based on selection


                              padding: const EdgeInsets.all(SSizes.sm),
                              backgroundColor:
                                  dark ? SColors.dark : SColors.white);
                        })),
              ),
            ),

            SAppBar(
              showBackArrow: true,
              actions: [
                SCircularIcon(
                    icon: Iconsax.heart5, color: Colors.red, onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
