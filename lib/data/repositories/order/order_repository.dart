import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:k_store/data/repositories/authentication/authentication_repository.dart';
import 'package:k_store/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;

  //Get all order related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
    } catch (e) {
        throw 'Something went wrong while fetching Order Information. Please try again later';
    }
  }
    //Store new user order
    Future<void> saveOrder(OrderModel order, String userId) async{
      try{
        await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
      } catch (e) {
        throw 'Something went wrongwhile saving Order Information. Please try again later';
      }
    }
  
}