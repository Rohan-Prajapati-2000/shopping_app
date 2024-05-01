import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/shop/models/product_model.dart';
import 'package:shoping_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoping_app/utils/exceptions/platform_exceptions.dart';

/// Repository for managing product-related data and operations.
class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interaction.
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async{
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromQuerySnapshot(e)).toList();

    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }


  /// Get Product based on brand
  Future<List<ProductModel>> fetchProductByQuery(Query? query) async{
    try{
      final querySnapshot = await query!.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc as DocumentSnapshot<Map<String, dynamic>>)).toList();
      return productList;

    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }





}