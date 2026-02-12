import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: context.width*0.025,
     height: context.width*0.025,
     decoration: BoxDecoration(
       color: AppColors.greyColor,
       borderRadius: BorderRadius.circular(50),
     ),
    );
  }
}