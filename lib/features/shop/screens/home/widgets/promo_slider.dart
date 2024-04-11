import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/images/s_rounded_image.dart';
import 'package:shoping_app/common/widgets/shimmers/shimmer.dart';
import 'package:shoping_app/features/shop/controllers/banner_controller.dart';
import 'package:shoping_app/features/shop/controllers/home_controller.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class SPromoSlider extends StatelessWidget {
  const SPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerControler());
    return Obx(() {
      // Loader
      if (controller.isLoading.value)
        return const SShimmerEffect(height: 190, width: double.infinity);

      // if no data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(

                /// all images stored in banners var of string
                items: controller.banners
                    .map((banner) => SRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index))),
            const SizedBox(height: SSizes.spaceBtwSections),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    SRoundedContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? SColors.primaryColor
                                : SColors.grey),
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
