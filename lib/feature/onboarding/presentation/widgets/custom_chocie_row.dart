// custom_chocie_row.dart
import 'package:animated_switch/animated_switch.dart';

import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomChocieRow extends StatelessWidget {
  const CustomChocieRow({
    super.key,
    required this.text,
    this.colorOn = AppColors.primaryLight,
    this.colorOff = Colors.grey,
    required this.textOn,
    required this.textOff,
    required this.iconOn,
    required this.iconOff,
    this.onChanged, required this.value,
  });

  final String text;
  final Color colorOn;
  final Color colorOff;
  final String textOn;
  final String textOff;
  final IconData iconOn;
  final IconData iconOff;
  final void Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text, style: AppStyles.medium20Primary),
        SizedBox(
          height: context.height * 0.045,
          child: AnimatedSwitch(
            value: value,

            colorOn: colorOn,
            colorOff: colorOff,
            indicatorColor: AppColors.whiteBgColor,
            iconOff: iconOff,
            iconOn: iconOn,
            textOn: textOn,
            textOff: textOff,
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
