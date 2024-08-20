import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:k_store/utils/constants/colors.dart';
import 'package:k_store/utils/constants/text_strings.dart';

import '../../../../../data/repositories/authentication/authentication_repository.dart';

class MHomeAppBar extends StatelessWidget {
  const MHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MColors.grey)),
          Text(MTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.white)),
        ],
      ),
      actions: [
         MCartCounterIcon(iconColor: MColors.white,onPressed: () =>AuthenticationRepository.instance.logout(),)
      ],
    );
  }
}
