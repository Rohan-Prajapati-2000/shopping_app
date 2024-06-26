import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/shop/models/category_model.dart';
import 'package:shoping_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoping_app/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  /// Get All Categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return list;
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Get Sub Categories
  /// Update Categories to the Cloud Firebase
}