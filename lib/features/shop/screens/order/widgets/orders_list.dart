import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

class MOrderListItems extends StatelessWidget {
  const MOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: MSizes.spaceBtwItems),
      itemBuilder: (_, index) =>  MRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MSizes.md),
        backgroundColor: dark ? MColors.dark : MColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Row(
              children: [
                //Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: MSizes.spaceBtwItems /2),
      
                //Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.primary, fontWeightDelta: 1)),
                      Text('01 Sep 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                //Icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: MSizes.iconSm))
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
      
            Row(
              children: [
                //Status & Date
                Expanded(
                  child: Row(
                    children: [
                      //Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: MSizes.spaceBtwItems /2),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('01 Sep 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      //Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: MSizes.spaceBtwItems /2),
      
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping date', style: Theme.of(context).textTheme.labelMedium),
                            Text('01 Sep 2024', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}