import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/features/shop/screens/checkout/checkout.dart';
import 'package:k_store/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(MSizes.defaultSpace),
        child: MCartItems()
      ),

      //Checkout Button
      bottomNavigationBar:    Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(
              onPressed: () => Get.to(() => const CheckoutScreen()), 
              child: const Text('Check out ${MTexts.currency}250')
            ),
      ),
    );
  }
}
