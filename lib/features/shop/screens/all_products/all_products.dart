import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: MSortableProducts(),
        ),
      ),
    );
  }
}
