import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:k_store/features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //Firestore instance for databse interactions
  final _db = FirebaseFirestore.instance;

  //Get limited featured products
    Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).limit(4).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;     
    }on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on PlatformException catch (e){
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
  try{
      //Upload all the products along with their Images
      final storage = Get.put(MFirebaseStorageService());

      //Loop through each product
      for (var product in products ) {
        //Get ImageData link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        //Upload Image and Get its URL
        final url = await storage.uploadImageData('Products/Images',thumbnail,product.thumbnail.toString());

        //Assign url to product.thumbnail attribute
        product.thumbnail = url;

        //Product list of images
        if(product.images != null && product.images!.isNotEmpty){
          List<String> imageUrl = [];
          for (var image in product.images!){
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //Upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            //Assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        
        //Upload Variation Images
        if(product.productType == ProductType.variable.toString()){
          for (var variation in product.productVariations!){
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            //Upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            //Assign URL to product.thumbnail attribute
           variation.image = url;
          }
        }

        //Store product in Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    }on FirebaseException catch (e) {
      throw e.message!;
    }on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e){
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}