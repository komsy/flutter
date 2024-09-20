import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/features/shop/models/product_model.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:k_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: MBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
          //Product Image slider
          MProductImageSlider(product: product),

          //Product details
          Padding(
            padding: const EdgeInsets.only(right: MSizes.defaultSpace, left: MSizes.defaultSpace, bottom: MSizes.defaultSpace),
            child: Column(
              children: [
                //Rating & Share
                const MRatingAndShare(),
                //Price, Title, Stock & Brand
                MProductMetaData(product: product),
                
                //Attributes
                if(product.productType == ProductType.variable.toString()) MProductAttributes(product: product),
                if(product.productType == ProductType.variable.toString()) const SizedBox(height: MSizes.spaceBtwSections),

                //Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                const SizedBox(height: MSizes.spaceBtwSections),

                //Description
                const MSectionHeading(title: 'Description',showActionButton: false),
                const SizedBox(height: MSizes.spaceBtwItems),
                ReadMoreText(
                  product.description ?? '',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',
                  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),

                //Reviews
                const Divider(),
                const SizedBox(height: MSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MSectionHeading(title: 'Reviews (199)',showActionButton: false),
                    IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                  ],
                ),
                const SizedBox(height: MSizes.spaceBtwSections),
              ],
            ),
          ),

          ]
        )
      ),
    );
  }
}
