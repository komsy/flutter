import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/common/styles/shadows.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/images/m_rounded_image.dart';
import 'package:k_store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:k_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:k_store/features/shop/controllers/products/product_controller.dart';
import 'package:k_store/features/shop/models/product_model.dart';
import 'package:k_store/features/shop/screens/product_details/product_detail.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../texts/m_brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calaculateSalePercentage(product.price, product.salePrice);


    //Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: dark ? MColors.darkerGrey : MColors.white,
        ), 
        
        child: Column(
          children: [
            MRoundedContainer(
              height: 180,
              width: 180,
              padding: const  EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  Center(child: MRoundedImage(height:180, width: 180 , image: product.thumbnail, applyImageRadius: true,imageType: ImageType.network)),
      
                  //Sale Tag
                  if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: MRoundedContainer(
                      radius: MSizes.sm,
                      backgroundColor: MColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: MSizes.sm, vertical: MSizes.xs),
                      child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black)),
                    ),
                  ),
      
                  //Favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: MFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems /2),
      
            //product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MSizes.sm),
              //Only reason to use Sized box is to make column full width
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MProductTitletext(title: product.title, smallSize: true,),
                    const SizedBox(height: MSizes.spaceBtwItems /2),
                    MBrandTitleTextWithVerifiedIcon(title: product.brand != null ? product.brand!.name : 'Unknown Brand'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType ==ProductType.single.toString() && product.salePrice > 0)
                       Padding(
                        padding: const EdgeInsets.only(left: MSizes.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: MSizes.sm),
                        child: MProductPriceText(price:  controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                //Add to cart button
                ProductCardAddToCartButton(product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}
