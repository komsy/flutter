import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: Text('Add new Address'), showBackArrow: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'PhoneNumber')),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
                  const SizedBox(width: MSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                  const SizedBox(width: MSizes.spaceBtwInputFields),
                  Expanded(child: TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),
                ],
              ),
              const SizedBox(height: MSizes.spaceBtwInputFields),
              TextFormField( decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
              const SizedBox(height: MSizes.defaultSpace),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save'))),

            ],
          ),
        ),
      ),
    );
  }
}