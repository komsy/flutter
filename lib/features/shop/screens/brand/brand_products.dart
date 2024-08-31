import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/brands/brand_card.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              //Brand detail
              MBrandCard(showBorder: true),
              SizedBox(height: MSizes.spaceBtwItems),

              MSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
