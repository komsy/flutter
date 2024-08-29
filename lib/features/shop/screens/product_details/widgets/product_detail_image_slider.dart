import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:k_store/common/widgets/icons/m_circular_icon.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/images/m_rounded_image.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class MProductImageSlider extends StatelessWidget {
  const MProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    
    return MCurvedEdgeWidget(
      child: Container(
        color: dark ? MColors.darkGrey: MColors.light,
        child: Stack(
          children: [
            //Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding:  EdgeInsets.all(MSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(MImages.productImage1))),
              )
            ),
    
            //Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: MSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __)=> const SizedBox(width: MSizes.spaceBtwItems),
                  itemBuilder: (_, index) => MRoundedImage(
                    width: 80,
                    height:80,
                    applyImageRadius: true,imageType: ImageType.asset,
                    backgroundColor: dark ? MColors.dark: MColors.white,
                    border: Border.all(color: MColors.primary),
                    // padding: const EdgeInsets.all(MSizes.sm),
                    image: MImages.productImage3,
                  ),
                ),
              ),
            ),
    
            //AppBar Icons
            const MAppBar(
              showBackArrow: true,
              actions: [MCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            )
          ],
        ),
      ),
    );
  }
}