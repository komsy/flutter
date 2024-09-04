import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/appbar/tabbar.dart';
import 'package:k_store/common/widgets/containers/search_container.dart';
import 'package:k_store/common/widgets/layouts/grid_layout.dart';
import 'package:k_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/features/shop/controllers/category_controller.dart';
import 'package:k_store/features/shop/screens/brand/all_brands.dart';
import 'package:k_store/features/shop/screens/store/widgets/category.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            MCartCounterIcon( onPressed: () {}, iconColor: null),
          ],
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: dark ? MColors.dark : MColors.white,
              expandedHeight: 440,
      
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(MSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:   [
                    //Search bar
                    const SizedBox(height: MSizes.spaceBtwItems),
                    const MSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false,padding: EdgeInsets.zero,),
                    const SizedBox(height: MSizes.spaceBtwSections),
      
                    //Featured brands
                    MSectionHeading(title: "Featured Brands",onPressed: () => Get.to(() => const AllBrandsScreen())),
                    const SizedBox(height: MSizes.spaceBtwItems / 1.5),
      
                    MGridLayout(
                      itemCount: 4, 
                      mainAxisExtent: 80, 
                      itemBuilder: (_, index) {
                        //Pass each brand and onPress event
                        return const MBrandCard(showBorder: false);
                    })
      
                  ],
                )
                ),
      
                //Tabs
                bottom: MTabBar(
                  tabs: categories.map((category) => Tab(child:  Text(category.name))).toList(),
                  ),
            )
          ];
        }, 
        body: TabBarView(
          children: categories.map((category) => MCategoryTab(category: category)).toList()
          )
        ),
      ),
    );
  }
}
