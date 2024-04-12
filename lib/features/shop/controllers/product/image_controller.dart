import 'package:get/get.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectProductImage = ''.obs;


  /// Get all images from product and Variations
  // List<String> getAllProductImages(ProductModel product){
  //
  // }

  /// Show Image Popup
  void showEnlargedImage(String image) {

  }

}