import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:k_store/utils/constants/image_strings.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';


class MHomeCategories extends StatelessWidget {
  const MHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_, index){
          return MVerticalImagetext(image: MImages.shoeIcon, title: 'Shoes Category', onTap: () => Get.to(() => const SubCategoriesScreen()),);
        } ,),
    );
  }
}