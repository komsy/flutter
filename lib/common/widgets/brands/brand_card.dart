import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/images/m_circular_image.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../texts/m_brand_title_text_with_verified_icon.dart';
import '../../../utils/constants/enums.dart';

class MBrandCard extends StatelessWidget {
  const MBrandCard({super.key, required this.showBorder, this.onTap});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
                  //Icon
                  Flexible(
                    child: MCircularImage(
                      image: MImages.clothIcon,
                      imageType: ImageType.asset,
                      backgroundColor: Colors.transparent,
                      overlayColor: THelperFunctions.isDarkMode(context) ? MColors.white : MColors.black,
                    ),
                  ),
                  const SizedBox(width: MSizes.spaceBtwItems / 2),
      
      
                  //Text
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                        Text(
                          '256 products dsfdeswef w qwdqw q  q  ',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
