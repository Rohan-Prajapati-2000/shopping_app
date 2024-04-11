import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/shop/models/banner_model.dart';
import 'package:shoping_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoping_app/utils/exceptions/format_exceptions.dart';
import 'package:shoping_app/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all orders related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try{
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const SFormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching banners';
    }
  }


  /// Upload banners to the cloud firestore

}