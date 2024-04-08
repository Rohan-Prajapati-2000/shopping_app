import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoping_app/data/repositories/authentication/authentication_repositories.dart';
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
      throw const SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails () async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Function to update user data in firestore.
  Future<void> updateUserDetails (UserModel updateUser) async{
    try{
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Update any field in specific users collection.
  Future<void> updateSingleField (Map<String, dynamic> json) async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Function to remove user data from firestore.
  Future<void> removeUserRecord (String userId) async{
    try{
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e){
      throw SFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const SFormatException();
    } on PlatformException catch(e){
      throw SPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
  /// Upload any image.

}