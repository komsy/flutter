import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:k_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:k_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const MBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          //Product Image slider
          const MProductImageSlider(),

          //Product details
          Padding(
            padding: const EdgeInsets.only(right: MSizes.defaultSpace, left: MSizes.defaultSpace, bottom: MSizes.defaultSpace),
            child: Column(
              children: [
                //Rating & Share
                const MRatingAndShare(),
                //Price, Title, Stock & Brand
                const MProductMetaData(),
                
                //Attributes
                const MProductAttributes(),
                const SizedBox(height: MSizes.spaceBtwSections),

                //Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                const SizedBox(height: MSizes.spaceBtwSections),

                //Description
                const MSectionHeading(title: 'Description',showActionButton: false),
                const SizedBox(height: MSizes.spaceBtwItems),
                const ReadMoreText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
