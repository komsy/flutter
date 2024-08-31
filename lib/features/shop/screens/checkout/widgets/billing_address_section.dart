import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';

import '../../../../../utils/constants/sizes.dart';

class MBillingAddressSection extends StatelessWidget {
  const MBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MSectionHeading(title: 'Shipping Address',showActionButton: false),
        Text('Coding with M', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: MSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text('+2547123456798', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text('721 Nkubu-Meru', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,),
          ],
        ),
      ],
    );
  }
}