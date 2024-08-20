import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:k_store/utils/exceptions/firebase_exceptions.dart';
import 'package:k_store/utils/exceptions/format_exceptions.dart';
import 'package:k_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/authentication/models/user/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance =>Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
}