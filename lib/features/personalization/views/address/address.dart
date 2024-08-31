import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/features/personalization/views/address/add_new_address.dart';
import 'package:k_store/features/personalization/views/address/widgets/single_address.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MColors.primary,
        onPressed: () => Get.to(() => const AddAddressScreen()),
        child: const Icon(Iconsax.add,color:  MColors.white),
      ),
      appBar: MAppBar(title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              MSingleAddress(selectedAddress: true),
              MSingleAddress(selectedAddress: false),
            ],
          ),
          ),
      ),
    );
  }
}