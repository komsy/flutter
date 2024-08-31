import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class MBillingPaymentSection extends StatelessWidget {
  const MBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark= THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        const MSectionHeading(title: 'Payment Method',showActionButton: false),
        const SizedBox(height: MSizes.spaceBtwItems),
        Row(
          children: [
            MRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? MColors.light : MColors.white,
              padding: const EdgeInsets.all(MSizes.sm),
              child: const Image(image: AssetImage(MImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
            
          ],
        )
      ],
    );
  }
}