import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/device/device_utility.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: MSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: ()  =>OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape:  const CircleBorder(), 
          backgroundColor: dark ? MColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
        ),
    );
  }
}
