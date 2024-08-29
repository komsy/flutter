import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import 'brand_card.dart';

class MBrandShowCase extends StatelessWidget {
  const MBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      showBorder: true,
      borderColor: MColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(MSizes.md),
      margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand with Products count
          const MBrandCard(showBorder: false),
    
          //Brand top 3 product images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),         
          
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context){
    return  Expanded(
      child: MRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? MColors.darkGrey : MColors.light,
        margin: const EdgeInsets.only(right: MSizes.sm),
        padding: const EdgeInsets.all(MSizes.md),
        child: Image(fit: BoxFit.contain,image: AssetImage(image)),
      ),
    );
  }
}