import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/styles/shadows.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/images/m_rounded_image.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../icons/m_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    //Container with side paddings, color, edges, radius and shadow.
    return GestureDetector(
      onTap: () {},
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
              padding: const  EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  const MRoundedImage(height:180, width: 180 , image: MImages.productImage1, applyImageRadius: true,imageType: ImageType.asset),
      
                  //Sale Tag
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
            const SizedBox(height: MSizes.spaceBtwItems /2),
      
            //product Details
            Padding(
              padding: const EdgeInsets.only(left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MProductTitletext(title: 'Green Nike Air Shoes', smallSize: true,),
                  const SizedBox(height: MSizes.spaceBtwItems /2),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(height: MSizes.xs),
                      const Icon(Iconsax.verify5, color: MColors.primary,size: MSizes.iconXs,)
                    ]
                  ),
                 
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                const Padding(
                  padding: EdgeInsets.only(left: MSizes.sm),
                  child: MProductPriceText(price: '3500.00'),
                ),

                //Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: MColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MSizes.cardRadiusMd),
                      bottomRight:  Radius.circular(MSizes.productImageRadius),
                    )
                  ),
                  child:const SizedBox(
                    width: MSizes.iconLg ,
                    height: MSizes.iconLg ,
                    child: Center(child: Icon(Iconsax.add, color: MColors.white)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
