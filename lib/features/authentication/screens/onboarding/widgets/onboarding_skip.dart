import 'package:flutter/material.dart';
import 'package:k_store/features/authentication/onboarding%20controllers/onboarding_controller.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/device/device_utility.dart';

class OnBoardingskip extends StatelessWidget {
  const OnBoardingskip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:TDeviceUtils.getAppBarHeight(),
      right:TSizes.defaultSpace,
      child: TextButton(
        onPressed: () =>OnBoardingController.instance.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
