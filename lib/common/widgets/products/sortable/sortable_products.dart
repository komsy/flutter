import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/layouts/grid_layout.dart';
import 'package:k_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:k_store/features/shop/models/product_model.dart';
import 'package:k_store/utils/constants/sizes.dart';

class MSortableProducts extends StatelessWidget {
  const MSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon:  Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name', 'Higher Price', 'Sale']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: MSizes.spaceBtwSections),
    
        //Products
        MGridLayout(
          itemCount: 4, 
          itemBuilder: (_,index) => MProductCardVertical(product: ProductModel.empty())
        ),
      ],
    );
  }
}