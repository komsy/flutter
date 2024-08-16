import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:k_store/features/authentication/screens/sigup/signup.dart';
import 'package:k_store/navigation_menu.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/constants/text_strings.dart';

class MLoginForm extends StatelessWidget {
  const MLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:MSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: MTexts.email),
              ),
            const SizedBox(height: MSizes.spaceBtwInputFields),
            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash)
                ),
              ),
            const SizedBox(height: MSizes.spaceBtwInputFields / 2),
            
                //Remember me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Row(
                  children:[
                    Checkbox(value:true, onChanged: (value){}),
                    const Text(MTexts.rememberMe),
                  ]
                ),
                TextButton(onPressed: () => Get.to(() => const ForgotPassword()), child: const Text(MTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwSections),
            //Sigin Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(MTexts.signIn))),
            const SizedBox(height: MSizes.spaceBtwItems),
    
            //Create Acc Button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(MTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}