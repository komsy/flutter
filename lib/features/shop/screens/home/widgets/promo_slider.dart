import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:k_store/utils/constants/enums.dart';

import '../../../../../common/widgets/images/m_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';


class MPromoSlider extends StatelessWidget {
  const MPromoSlider({
    super.key, required this.banners
  });
  
  final List<String> banners;

  @override
  Widget build(BuildContext context) {    
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url)=> MRoundedImage(
            width: 400,height:400,image: url, imageType: ImageType.asset,)).toList(),
          ),
          const SizedBox(height: MSizes.spaceBtwItems),
    
          Center(
            child: Obx(
              () =>Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < banners.length; i++)
                  MCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i ? MColors.primary: MColors.grey,
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
