import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k_store/features/authentication/screens/login/login.dart';
import 'package:k_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:k_store/features/authentication/screens/sigup/verify_email.dart';
import 'package:k_store/navigation_menu.dart';
import 'package:k_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:k_store/utils/exceptions/firebase_exceptions.dart';
import 'package:k_store/utils/exceptions/format_exceptions.dart';
import 'package:k_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance =>Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn(); 

  //Called from amin.dart on app launch
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect(); //pass current user
  }

  //Fn to show relevant screen
  screenRedirect () async {
    final user = _auth.currentUser;
    // if(kDebugMode){
    //   print('==========Get StorageAuth Repo============');
    //   print(deviceStorage.read('isFirstTime'));
    // }
    //Loacal Storage
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  /* -------------Email & Password SignIn---------------- */

  //EmailAuthentication - SignIn
  Future <UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
        return await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  //EmailAuthentication - Register
  Future <UserCredential> registerWithEmailAndPassword(String email, String password) async{
  try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
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

  //EmailVerification - Mail Verification
  Future<void> sendEmailVerification () async {
    try{
      await _auth.currentUser?.sendEmailVerification();
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
  //Email forgot password
    Future<void> sendPasswordresetEmail (String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
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

  //Signin with Google
  Future <UserCredential> signInWithGoogle() async{
    try{
        //Trigger the authentication flow
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

        //Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

        //Create a new credential
        final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);

        //Once signed in, return the usercredential
        return await _auth.signInWithCredential(credentials);

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

  //ReAuthenticate - ReAuthenticate User


  //EmailAuthentication - Forget Pasword

  //Logout user
    Future<void> logout () async {
    try{
      // Sign out with google
      await GoogleSignIn().signOut();
      // Sign out with firebase
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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