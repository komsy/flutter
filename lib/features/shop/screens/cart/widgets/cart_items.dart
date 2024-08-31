import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class MCartItems extends StatelessWidget {
  const MCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_,__) => const SizedBox(height: MSizes.spaceBtwSections), 
          itemCount: 4,
          itemBuilder: (_, index) =>  Column(
            children: [
              const MCartItem(),
              if(showAddRemoveButtons)const SizedBox(height: MSizes.spaceBtwItems),
      
              if(showAddRemoveButtons)const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Add Remove Qty buttons
                  Row(
                    children: [
                      //Extra Space
                      SizedBox(width: 70),
                      //Add remove button
                      MProductQuantityWithAddRemoveButton(),
                    ],
                  ),
      
                  MProductPriceText(price: '250'),
      
                ],
              ),
            ],
          ), 
        );
  }
}