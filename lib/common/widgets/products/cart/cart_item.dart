import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/images/m_rounded_image.dart';
import 'package:k_store/common/widgets/texts/m_brand_title_text_with_verified_icon.dart';
import 'package:k_store/common/widgets/texts/product_title_text.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

class MCartItem extends StatelessWidget {
  const MCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        MRoundedImage(
          image: MImages.productImage1,
          width: 60,
          height: 60,
          //padding: EdgeInsets.all(MSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? MColors.darkerGrey : MColors.light,
          imageType: ImageType.asset
        ),
        const SizedBox(width: MSizes.spaceBtwItems),
    
        //Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: MProductTitletext(title: 'Black Sports Shoes', maxLines: 1)),
          
              //Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                    
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodyLarge),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}