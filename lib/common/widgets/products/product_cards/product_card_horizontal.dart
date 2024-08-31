import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/images/m_rounded_image.dart';
import 'package:k_store/common/widgets/texts/m_brand_title_text_with_verified_icon.dart';
import 'package:k_store/common/widgets/texts/product_price_text.dart';
import 'package:k_store/common/widgets/texts/product_title_text.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/m_circular_icon.dart';

class MProductCardHorizontal extends StatelessWidget {
  const MProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    //Container with side paddings, color, edges, radius and shadow.
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: dark ? MColors.darkerGrey : MColors.softGrey,
        ),
        child: Row(
          children: [
            //Thumbnail
            MRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: MRoundedImage(imageType: ImageType.asset, image: MImages.productImage1,applyImageRadius: true)
                  ),
                  
                  Positioned(
                    top: 12,
                    child: MRoundedContainer(
                      radius: MSizes.sm,
                      backgroundColor: MColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: MSizes.sm, vertical: MSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black)),
                    ),
                  ),
      
                  //Favorite icon button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: MCircularIcon(icon: Iconsax.heart5,color: Colors.red),
                  ),
                ],
              ),
            ),

            //Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: MSizes.sm, left: MSizes.sm),
                child: Column(
                  children: [
                       const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MProductTitletext(title: 'Green Nike Hal Sleeves Shirt', smallSize: true),
                          SizedBox(height: MSizes.spaceBtwItems /2),
                          MBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                        ],
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Pricing
                          const Flexible(child: MProductPriceText(price: '250')),

                          //Add to cart
                          Container(
                            decoration: const BoxDecoration(
                              color: MColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MSizes.cardRadiusMd),
                                bottomRight:  Radius.circular(MSizes.productImageRadius),
                              )
                            ),
                            child:const SizedBox(
                              width: MSizes.iconLg  * 1.2,
                              height: MSizes.iconLg * 1.2 ,
                              child: Center(child: Icon(Iconsax.add, color: MColors.white)),
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}