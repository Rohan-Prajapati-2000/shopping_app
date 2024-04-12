import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectProductImage = ''.obs;

  /// Get all images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    /// Load Product thumbnail image
    images.add(product.thumbnail);

    /// Assign Thumbnail as selected image
    selectProductImage.value = product.thumbnail;

    /// Get all images from the Product Model if not null
    if (product.thumbnail != null) {
      images.addAll(product.images!);
    }

    /// Get all images from the Product Variations if not null.
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show Full Screen Image when user click on image of items
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: SSizes.defaultSpace * 2,
                        horizontal: SSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 150,
                        child: OutlinedButton(
                            onPressed: () => Get.back(), child: const Text('Close'))),
                  )
                ],
              ),
            ));
  }
}
