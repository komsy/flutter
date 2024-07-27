import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:k_store/features/authentication/onboarding%20controllers/onboarding_controller.dart';
import 'package:k_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:k_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:k_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:k_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return  Scaffold(
      body: Stack(
        children: [
          //Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatepageIndiator,
            children: const [
               OnBoardingPage(
                image:TImages.onBoardingImage1,
                title:TTexts.onBoardingTitle1,
                subTitle:TTexts.onBoardingSubTitle1
                ),
                
               OnBoardingPage(
                image:TImages.onBoardingImage2,
                title:TTexts.onBoardingTitle2,
                subTitle:TTexts.onBoardingSubTitle2
                ),
                
               OnBoardingPage(
                image:TImages.onBoardingImage3,
                title:TTexts.onBoardingTitle3,
                subTitle:TTexts.onBoardingSubTitle3
                ),
            ],
          ),
                    
          //Skip button
          const OnBoardingskip(),

          //Dot navigation smoothpageindicator
          const OnBoardingDotNavigation(),

          //Circular button
          const OnBoardingNextButton()
        ],
      )
    );
  }
}
