import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/containers/rounded_container.dart';
import 'package:k_store/common/widgets/containers/search_container.dart';
import 'package:k_store/common/widgets/layouts/grid_layout.dart';
import 'package:k_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/utils/constants/enums.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/m_circular_image.dart';
import '../../../../common/widgets/texts/m_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
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
                  const MSectionHeading(title: "Featured Brands"),
                  const SizedBox(height: MSizes.spaceBtwItems / 1.5),

                  MGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: MRoundedContainer(
                        padding: const EdgeInsets.all(MSizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                                  //Icon
                                  Flexible(
                                    child: MCircularImage(
                                      image: MImages.clothIcon,
                                      imageType: ImageType.asset,
                                      backgroundColor: Colors.transparent,
                                      overlayColor: THelperFunctions.isDarkMode(context) ? MColors.white : MColors.black,
                                    ),
                                  ),
                                  const SizedBox(width: MSizes.spaceBtwItems / 2),
                      
                                  //Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const MBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                        Text(
                                          '256 products dsfdeswef w qwdqw q  q  ',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    );
                  })

                ],
              )
              ),
          )
        ];
      }, 
      body: Container()),
    );
  }
}
