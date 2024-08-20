import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:k_store/features/shop/screens/home/widgets/home_appbar.dart';

import '../../../../utils/constants/sizes.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             MPrimaryHeaderContainer(
              child: Column(
                children: [
                  MHomeAppBar(),
                  
                SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
