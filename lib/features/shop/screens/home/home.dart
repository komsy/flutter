import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:k_store/utils/constants/image_strings.dart';

import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_products/all_products.dart';
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
           MPrimaryHeaderContainer(
              child: Column(
                children: [
                   const MHomeAppBar(),                  
                   const SizedBox(height: MSizes.spaceBtwSections),

                  //SearchBar
                   const MSearchContainer(text: "Search in Store"),
                   const SizedBox(height: MSizes.spaceBtwSections),

                  //Categories
                  Padding(
                    padding:  const EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                         MSectionHeading(title: 'Popular Categories', textColor: Colors.white,showActionButton: false, onPressed: () {},),
                         const SizedBox(height: MSizes.spaceBtwItems),

                        //Categories
                        const MHomeCategories()
                      ],
                    ),
                  ),

                  const SizedBox(height: MSizes.spaceBtwSections),
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
                  MSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
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
