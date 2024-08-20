import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:k_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:k_store/common/widgets/texts/section_heading.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class SetttingsScreen extends StatelessWidget {
  const SetttingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          //Header
          MPrimaryHeaderContainer(
            child: Column(
              children: [
                MAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: MColors.white),),),

                //User profile card
                const MUserProfileTile(),
                const SizedBox(height: MSizes.spaceBtwSections),
              ],
            )
            ),

          //Body
          Padding(
            padding: const EdgeInsets.all(MSizes.defaultSpace),
            child: Column(
              children: [
                //Account Setting
                const MSectionHeading(title: 'Account Setting'),
                const SizedBox(height: MSizes.spaceBtwItems),

                MSettingsMenuTile(icon: Iconsax.safe_home, title: "My Addresses", subTitle: "Set shopping delivery address", onTap: () {}),
                MSettingsMenuTile(icon: Iconsax.safe_home, title: "My Cart", subTitle: "Add, remove products", onTap: () {}),

                //App Setting
                const SizedBox(height: MSizes.spaceBtwSections),
                const MSectionHeading(title: 'App Settings'),
                const SizedBox(height: MSizes.spaceBtwItems),
                MSettingsMenuTile(icon: Iconsax.document_upload, title: "Load Data", subTitle: "Add, remove products", trailing: Switch(value: false, onChanged: (value) {})),

                //Logout Button
                const SizedBox(height: MSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child:  OutlinedButton(onPressed: () =>AuthenticationRepository.instance.logout(), child: const Text('Logout')),
                ),
                const SizedBox(height: MSizes.spaceBtwSections * 2.5 ),
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}

