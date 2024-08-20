import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:k_store/data/repositories/user/user_repository.dart';
import 'package:k_store/utils/popups/loaders.dart';

import '../../authentication/models/user/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try{
      if(userCredentials !=null){
        //Convert name to first and last names
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //Map data
        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstName: nameParts[0], 
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
          userName: username, 
          email: userCredentials.user!.email ?? '', 
          phoneNumber: userCredentials.user!.phoneNumber ?? '', 
          profilePicture: userCredentials.user!.photoURL ?? '', 
          );
        //Save user data
        await userRepository.saveUserRecord(user);
      }
    }catch(e){
      MLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile'
        );
    }
  }
}