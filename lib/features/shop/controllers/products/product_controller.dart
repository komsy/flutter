import 'package:get/get.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/popups/loaders.dart';

import '../../../../data/repositories/products/product_repository.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //Variables
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
 

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  //Fetch Banners
  Future<void> fetchFeaturedProducts() async {
    try{
      //Show loader while loading banners
      isLoading.value = true;

      //Fetch Banners from data source(Firestore, API, etc)
      final products = await productRepository.getFeaturedProducts();
      
      //Assign banners
      featuredProducts.assignAll(products);

    }catch (e) {
      MLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      //Remove Loader
      isLoading.value = false;
    }
  }

  //Get the product price or price range for variations
  String getProductPrice (ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice= 0.0;

    //If no variations exists, return the simple price or sale price
    if(product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      //Calculate the samllest and largest among variations
      for(var variation in product.productVariations!){
        //Determine the price to consider (Sale price if available, otherwise regular price)
        double priceToConsinder = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //Update smallest and largest prices
        if(priceToConsinder < smallestPrice){
          smallestPrice = priceToConsinder;
        }
        if(priceToConsinder > largestPrice){
          largestPrice = priceToConsinder;
        }
      }
      //If smallest and largest prices a re the same, retun a single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else {
        //Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  //Calculate discount percentage
  String? calaculateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //Check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}