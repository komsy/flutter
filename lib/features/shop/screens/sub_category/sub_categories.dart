import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/images/m_rounded_image.dart';
import 'package:k_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:  MSizes.defaultSpace, right: MSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const MRoundedImage(width: double.infinity,height: 300, imageType: ImageType.asset, image: MImages.promoBanner3, applyImageRadius: true),
              const SizedBox(height: MSizes.spaceBtwSections),

              //Sub-Categories
              Column(
                children: [
                  //Heading
                  const MSectionHeading(title: 'Sports Shirts'),
                  const SizedBox(height: MSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: MSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const MProductCardHorizontal()
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}