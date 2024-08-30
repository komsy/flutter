import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/texts/product_price_text.dart';
import 'package:k_store/common/widgets/texts/product_title_text.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/rounded_choice_chips.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MProductAttributes extends StatelessWidget {
  const MProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.md),
          backgroundColor: dark ? MColors.darkerGrey : MColors.grey,
          child: Column(
            children: [
              //Title, Price & Stock Status
              Row(
                children: [
                  const MSectionHeading(title: 'Variation'),
                  const SizedBox(width: MSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const MProductTitletext(title: 'Price: ', smallSize: true),
                          const SizedBox(width: MSizes.spaceBtwItems / 2),
                          //Actual Price
                          Text('${MTexts.currency}25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: MSizes.spaceBtwItems),
                          //Sale Price
                          const MProductPriceText(price: '20')
                        ],
                      ),

                      //Stock
                      Row(
                        children: [
                          const MProductTitletext(title: 'Stock: ', smallSize: true),
                          Text(' In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              //Variation Description
              const MProductTitletext(
                title: 'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: MSizes.spaceBtwItems),
        
        //Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading(title: 'Colors'),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(text: 'Blue',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Green',selected: true, onSelected: (value) {}),
                MChoiceChip(text: 'Yellow',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Blue',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Green',selected: true, onSelected: (value) {}),
                MChoiceChip(text: 'Yellow',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Blue',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'Green',selected: true, onSelected: (value) {}),
                MChoiceChip(text: 'Yellow',selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading(title: 'Sizes'),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(text: 'KE 34',selected: true, onSelected: (value) {}),
                MChoiceChip(text: 'KE 36',selected: false, onSelected: (value) {}),
                MChoiceChip(text: 'KE 36',selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),



      ],
    );
  }
}
