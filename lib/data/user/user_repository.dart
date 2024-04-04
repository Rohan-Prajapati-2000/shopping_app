import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping_app/features/authentication/models/user_model/user_model.dart';
import 'package:shoping_app/utils/exceptions/firebase_exceptions.dart';
import 'package:shoping_app/utils/exceptions/format_exceptions.dart';
import 'package:shoping_app/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord (UserModel user) async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

}