import 'package:flutter/material.dart';
import 'package:k_store/common/widgets/appbar/appbar.dart';
import 'package:k_store/common/widgets/custom_shapes/containers/primary_header_containers.dart';
import 'package:k_store/utils/constants/colors.dart';

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
                MAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: MColors.white),),)
              ],
            )
            )

          //Body

          ],
        ),
      ),
    );
  }
}