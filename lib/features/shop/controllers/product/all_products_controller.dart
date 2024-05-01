import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoping_app/data/repositories/product/product_repository.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class AllProductsControlller extends GetxController{
  static AllProductsControlller get instance => Get.find();

  final repository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async{
    try{
      if(query == null) return [];

      final product = await repository.fetchProductByQuery(query);
      return product;

    }catch (e){
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return[];
    }
  }
}