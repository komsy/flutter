import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/images/m_circular_image.dart';
import 'package:k_store/common/widgets/texts/m_brand_title_text_with_verified_icon.dart';
import 'package:k_store/common/widgets/texts/product_title_text.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MProductMetaData extends StatelessWidget {
  const MProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            MRoundedContainer(
              radius: MSizes.sm,
              backgroundColor: MColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: MSizes.sm, vertical: MSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MColors.black)),
            ),
            const SizedBox(width: MSizes.spaceBtwItems),

            Text('${MTexts.currency} 250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: MSizes.spaceBtwItems),
            const MProductPriceText(price: ' 175', isLarge: true),
            const SizedBox(width: MSizes.spaceBtwItems / 1.5),

                       
          ],
        ),
        //Title
        const MProductTitletext(title: 'Green Nike Sports Shirt'),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        //Stock Status
        Row(
          children: [
            const MProductTitletext(title: 'Status'),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: MSizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            MCircularImage(
              width: 32,
              height: 32,
              image: MImages.shoeIcon,
              overlayColor: dark ? MColors.white : MColors.dark,
            ),
            const MBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ) 
      ],
    );
  }
}