import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:k_store/utils/constants/image_strings.dart';

import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           const MPrimaryHeaderContainer(
              child: Column(
                children: [
                   MHomeAppBar(),                  
                   SizedBox(height: MSizes.spaceBtwSections),

                  //SearchBar
                   MSearchContainer(text: "Search in Store"),
                   SizedBox(height: MSizes.spaceBtwSections),

                  //Categories
                  Padding(
                    padding:  EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                         MSectionHeading(title: 'Popular Categories', textColor: Colors.white,),
                         SizedBox(height: MSizes.spaceBtwItems),

                        //Categories
                        MHomeCategories()
                      ],
                    ),
                  ),

                  SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),
            ),

            //Body
             Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child:  Column(
                children: [
                  const MPromoSlider(banners: [MImages.promoBanner1,MImages.promoBanner2,MImages.promoBanner3]),
                  const SizedBox(height: MSizes.spaceBtwSections),

                  //Heading
                  const MSectionHeading(title: 'Popular Products'),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  
                  //Popular Products 
                  MGridLayout(itemCount: 2,itemBuilder: (_,index) =>  const MProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
