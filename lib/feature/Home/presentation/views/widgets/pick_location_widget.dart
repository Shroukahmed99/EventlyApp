import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class PickLocationWidget extends StatelessWidget {
  const PickLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.center, 
        children: [
          Row(
            children: [
              Icon(
                Icons.place,
                color: context.themeProvider.isDark()
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.event_location,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: AppColors.primaryLight,
          ),
        ],
      ),
    );
  }
}
