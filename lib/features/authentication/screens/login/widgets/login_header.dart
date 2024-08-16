import 'package:flutter/material.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/constants/text_strings.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';



class MLoginHeader extends StatelessWidget {
  const MLoginHeader({ super.key });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image (
        height: 150,
        image: AssetImage(dark ? MImages.lightAppLogo : MImages.darkAppLogo),
      ),
      Text(MTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height:MSizes.sm),
      Text(MTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
    ],
    );
  }
}