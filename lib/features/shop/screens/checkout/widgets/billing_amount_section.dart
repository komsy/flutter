import 'package:flutter/material.dart';
import 'package:k_store/utils/constants/text_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class MBillingAmountSection extends StatelessWidget {
  const MBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('${MTexts.currency} 250', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        //Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${MTexts.currency} 5', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('${MTexts.currency} 25', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('${MTexts.currency} 500', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}