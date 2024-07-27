import 'package:flutter/material.dart';
import 'package:k_store/common/styles/spacing_styles.dart';
import 'package:k_store/utils/constants/image_strings.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/constants/text_strings.dart';
import 'package:k_store/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo, Title & Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image (
                  height: 150,
                  image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                ),
                Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height:TSizes.sm),
                Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
              )
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Icona)),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}