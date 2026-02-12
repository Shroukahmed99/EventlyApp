import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EventTabItem extends StatelessWidget {
  const EventTabItem({
    super.key,
    required this.text,
    required this.isSelected,
    this.borderColor,
    this.icon, // أضفنا متغير أيقونة
  });

  final String text;
  final bool isSelected;
  final Color? borderColor;
  final IconData? icon; // أيقونة اختيارية

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.themeProvider.isDark();
    final Color defaultBorderColor =
        isDark ? AppColors.primaryLight : AppColors.whiteColor;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.01),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
        vertical: context.height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected
            ? context.themeProvider.themeApp.focusColor
            : context.themeProvider.themeApp.primaryColor,
        border: Border.all(
          color: borderColor ?? defaultBorderColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 18,
              color: isSelected
                  ? context.themeProvider.themeApp.textTheme.bodySmall?.color
                  : context.themeProvider.themeApp.textTheme.bodyLarge?.color,
            ),
            SizedBox(width: context.width * 0.01),
          ],
          CustomText(
            text: text,
            style: isSelected
                ? context.themeProvider.themeApp.textTheme.bodySmall
                : context.themeProvider.themeApp.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
