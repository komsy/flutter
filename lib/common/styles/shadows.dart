
import 'package:flutter/widgets.dart';
import 'package:k_store/utils/constants/colors.dart';

class MShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: MColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: MColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}