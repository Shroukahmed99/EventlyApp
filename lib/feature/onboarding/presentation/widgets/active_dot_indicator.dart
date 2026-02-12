import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class AtiveDotsIndicator extends StatelessWidget {
  const AtiveDotsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: context.width*0.07,
     height: context.height*0.015,
     decoration: BoxDecoration(
       color: AppColors.primaryLight,
       borderRadius: BorderRadius.circular(50),
     ),
    );
  }
}

