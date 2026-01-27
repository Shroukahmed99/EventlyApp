// on_boarding_view.dart
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/constants/app_colors.dart';
import 'package:evently_app/core/utils/extensions.dart';
import 'package:evently_app/core/utils/navigation.dart';
import 'package:evently_app/core/utils/themes.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/onBoarding/presentation/on_boarding_view.dart';
import 'package:evently_app/onBoarding/presentation/widgets/content_scroll_on_boarding.dart';
import 'package:evently_app/onBoarding/presentation/widgets/custom_chocie_row.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/provider/translation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});
  static String routeName = "getStartedView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.logoRow,
                  height: context.height * 0.07,
                  width: context.width * 0.35,
                ),
              ),
              SizedBox(height: context.height * .03),
              ContentScrollOnBoarding(
                image: AppAssets.onboarding1,
                title: AppLocalizations.of(context)!.onboard_personalize_title,
                subTitle: AppLocalizations.of(
                  context,
                )!.onboard_personalize_desc,
              ),
              SizedBox(height: context.height * .03),
              CustomChocieRow(
                text: AppLocalizations.of(context)!.theme,
                colorOn: AppColors.blueColor,
                colorOff: AppColors.primaryDark,
                textOn: AppLocalizations.of(context)!.light,
                textOff: AppLocalizations.of(context)!.dark,
                iconOn: Icons.light_mode,
                iconOff: Icons.dark_mode,
                onChanged: (isOn) {
                  context.themeProvider.changeTheme(
                    isOn ? ThemeApp.LightTheme : ThemeApp.DarkTheme,
                  );
                },
              ),
              SizedBox(height: context.height * 0.03),
              CustomChocieRow(
                text: AppLocalizations.of(context)!.language,
                colorOn: AppColors.blueColor,
                colorOff: AppColors.primaryDark,
                textOn: "AR",
                textOff: "EN",
                iconOn: Icons.language,
                iconOff: Icons.language,
                onChanged: (isOn) {
                  context.localProvider.changeLocale(isOn ? "ar" : "en");
                },
              ),
              SizedBox(height: context.height * 0.03),
              CustomButton(
                text: "Let’s Start",
                onPressed: () {
                  context.pushNamed(OnBoardingView.routeName);
                },
                width: double.infinity,
                height: context.height * 0.06,
              ),
              SizedBox(height: context.height * 0.03),
              Row(
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
