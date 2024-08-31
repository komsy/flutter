import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/icons/m_circular_icon.dart';
import '../../../../../utils/constants/colors.dart';

class MProductQuantityWithAddRemoveButton extends StatelessWidget {
  const MProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MCircularIcon(
           icon: Iconsax.minus,
           width: 32,
           height: 32,
           size: MSizes.md,
           color: dark ? MColors.white : MColors.black,
           backgroundColor: dark ?  MColors.darkGrey : MColors.light,
         ),
         const SizedBox(width: MSizes.spaceBtwItems),
         Text('2', style: Theme.of(context).textTheme.titleSmall),
         const SizedBox(width: MSizes.spaceBtwItems),
    
         const MCircularIcon(
           icon: Iconsax.add,
           backgroundColor: MColors.primary,
           width: 32,
           height: 32,
           size: MSizes.md,
           color: MColors.white,
         ),
      ],
    );
  }
}
