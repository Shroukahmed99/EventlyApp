import 'package:evently_app/config/themes/theme%20provider/theme_provider.dart';
import 'package:evently_app/config/themes/themes.dart';
import 'package:evently_app/core/cache/shared_pref/pref_keys.dart';
import 'package:evently_app/core/cache/shared_pref/shared_pref.dart';
import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_drop_down.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerProfileTab(context),
        SizedBox(height: context.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomText(
            text: AppLocalizations.of(context)!.language,
            style: context.watch<ThemeProvider>().themeApp.textTheme.headlineLarge,
          ),
        ),
        SizedBox(height: context.height * 0.02),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomCreateDropDown<String>(
            items: ["ar", "en"],
            hintText: AppLocalizations.of(context)!.language,
            value: context.localProvider.locale,
            onChanged: (value) {
              context.localProvider.changeLocale(value!);
              SharedPref.preferences.setString(PrefKeys.lang, value);
            },
            itemToWidget: (item) {
              if (item == "ar")
                return Text(AppLocalizations.of(context)!.arabic);
              return Text(AppLocalizations.of(context)!.englis);
            },
          ),
        ),

        SizedBox(height: context.height * 0.03),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomText(
            text: AppLocalizations.of(context)!.theme,
            style: context.watch<ThemeProvider>().themeApp.textTheme.headlineLarge,
          ),
        ),
        SizedBox(height: context.height * 0.02),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: CustomCreateDropDown<ThemeData>(
            items: [ThemeApp.LightTheme, ThemeApp.DarkTheme],
            hintText: "Select Theme",
            
            value: context.themeProvider.themeApp,
            onChanged: (value) {
              if (value != null) context.themeProvider.changeTheme(value);
              SharedPref.preferences.setString(PrefKeys.themeMode,  value == ThemeApp.LightTheme ? "light" : "dark",);
            },
            itemToWidget: (theme) {
              if (theme == ThemeApp.LightTheme) return const Text("Light");
              return const Text("Dark");
            },
          ),
        ),
Spacer(),
        //  SizedBox(height: context.height * 0.02),
         Padding(
           padding: const EdgeInsets.only(left: 16 ,right: 16,   ),
           child: CustomButton(text: AppLocalizations.of(context)!.logout, 
           backgroundColor: AppColors.redColor.withOpacity(0.9),
           icon: Icon(Icons.logout ,color: AppColors.whiteColor,),
           onPressed: (){}),
         ),
         SizedBox(height: context.height * 0.20),
      ],
    );
  }
}

Widget headerProfileTab(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: context.height * 0.04,
      horizontal: 24,
    ),
    width: double.infinity,

    decoration: BoxDecoration(
      color: AppColors.blueColor,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            CustomText(text: "John Safwat", style: AppStyles.bold24White),
            SizedBox(height: context.height * 0.01),
            CustomText(
              text: "johnsafwat.route@gmail.com",
              style: AppStyles.medium16White,
            ),
          ],
        ),

        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Icon(Icons.person, size: 35, color: AppColors.whiteColor),
        ),
      ],
    ),
  );
}
