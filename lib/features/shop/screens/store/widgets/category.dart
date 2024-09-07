import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/layouts/grid_layout.dart';
import 'package:k_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/features/shop/models/category_model.dart';
import 'package:k_store/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class MCategoryTab extends StatelessWidget {
  const MCategoryTab({super.key, required this.category});
  
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ 
        Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [

              //Brands
              const MBrandShowCase(images: [MImages.productImage3,MImages.acerlogo]),
              const SizedBox(height: MSizes.spaceBtwItems),

              //Products
              const MSectionHeading(title: 'You might like'),
              const SizedBox(height: MSizes.spaceBtwItems),

              MGridLayout(itemCount: 4, itemBuilder: (_, index) => MProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: MSizes.spaceBtwSections),
            ],
          ),
        ),
      ]
    );
  }
}