import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_store/data/repositories/authentication/authentication_repository.dart';
import 'package:k_store/utils/exceptions/firebase_exceptions.dart';
import 'package:k_store/utils/exceptions/format_exceptions.dart';
import 'package:k_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/authentication/models/user/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance =>Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore
  Future <void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
     }on FirebaseException catch (e) {
        throw MFirebaseException(e.code).message;
      }on FormatException catch (_) {
        throw const MFormatException();
      } on PlatformException catch (e){
        throw MPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

  //Function to save user data to Firestore
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
     }on FirebaseException catch (e) {
        throw MFirebaseException(e.code).message;
      }on FormatException catch (_) {
        throw const MFormatException();
      } on PlatformException catch (e){
        throw MPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

  //Function to save user data to Firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
     }on FirebaseException catch (e) {
        throw MFirebaseException(e.code).message;
      }on FormatException catch (_) {
        throw const MFormatException();
      } on PlatformException catch (e){
        throw MPlatformException(e.code).message;
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }
    //Function to save user data to Firestore
    Future<void> updateSingleField(Map<String, dynamic> json) async {
      try {
        await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
      }on FirebaseException catch (e) {
          throw MFirebaseException(e.code).message;
        }on FormatException catch (_) {
          throw const MFormatException();
        } on PlatformException catch (e){
          throw MPlatformException(e.code).message;
        } catch (e) {
          throw 'Something went wrong. Please try again';
        }
      }
      //Function to save user data to Firestore
    Future<void> removeUserRecord(String userId) async {
      try {
        await _db.collection("Users").doc(userId).delete();
      }on FirebaseException catch (e) {
          throw MFirebaseException(e.code).message;
        }on FormatException catch (_) {
          throw const MFormatException();
        } on PlatformException catch (e){
          throw MPlatformException(e.code).message;
        } catch (e) {
          throw 'Something went wrong. Please try again';
        }
      }

  //Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    }on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    }on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e){
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}