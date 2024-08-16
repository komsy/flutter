import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
                Text(MTexts.forgetPasswordTitle,
                    style:Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MSizes.spaceBtwItems),
                Text(MTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: MSizes.spaceBtwSections * 2),

            //Texctfield
            TextFormField(decoration: const InputDecoration(labelText: MTexts.email, prefixIcon: Icon(Iconsax.direct_right)),),
            const SizedBox(height: MSizes.spaceBtwSections),

            //Submit Button
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()),child: const Text(MTexts.submit))),
          ],
        ),
      ),
    );
  }
}