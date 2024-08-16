import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/login_signup/terms_conditions_checkbox.dart';
import 'package:k_store/features/authentication/screens/sigup/verify_email.dart';
import 'package:k_store/utils/constants/sizes.dart';
import 'package:k_store/utils/constants/text_strings.dart';

class MSignUpForm extends StatelessWidget {
  const MSignUpForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands:false,
                  decoration: const InputDecoration(labelText: MTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands:false,
                  decoration: const InputDecoration(labelText: MTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),
    
          //Username
          TextFormField(
            expands:false,
            decoration: const InputDecoration(labelText: MTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),
    
          //Email
          TextFormField(
            expands:false,
            decoration: const InputDecoration(labelText: MTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),
    
          //Phone Number
          TextFormField(
            expands:false,
            decoration: const InputDecoration(labelText: MTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwInputFields),
    
          //Password
          TextFormField(
            obscureText:true,
            decoration: const InputDecoration(
              labelText: MTexts.password, 
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwSections),
    
          //Terms & Conditions CheckboxRow(
          const MTermsAndConditionsCheckbox(),
          const SizedBox(height: MSizes.spaceBtwSections),
    
          //Sigup Button
          SizedBox(width: double.infinity, 
          child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: const Text(MTexts.createAccount))),
  
        ],
      )
      );
  }
}
