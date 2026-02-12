import 'package:evently_app/config/themes/theme%20provider/theme_provider.dart';
import 'package:evently_app/config/themes/themes.dart';
import 'package:evently_app/core/cache/shared_pref/pref_keys.dart';
import 'package:evently_app/core/cache/shared_pref/shared_pref.dart';
import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/container_with_icon.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/event_tab_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBarHome extends StatefulWidget {
  CustomAppBarHome({super.key});

  @override
  State<CustomAppBarHome> createState() => _CustomAppBarHomeState();
}

class _CustomAppBarHomeState extends State<CustomAppBarHome> {
  TabController? controller;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eventsList = [
      {"text": AppLocalizations.of(context)!.all, "icon": Icons.grid_view},
      {"text": AppLocalizations.of(context)!.sport, "icon": Icons.sports_soccer},
      {"text": AppLocalizations.of(context)!.birthday, "icon": Icons.cake},
      {"text": AppLocalizations.of(context)!.meeting, "icon": Icons.people},
      {"text": AppLocalizations.of(context)!.gaming, "icon": Icons.videogame_asset},
      {"text": AppLocalizations.of(context)!.workshop, "icon": Icons.handyman},
      {"text": AppLocalizations.of(context)!.book_club, "icon": Icons.menu_book},
      {"text": AppLocalizations.of(context)!.exhibition, "icon": Icons.art_track},
      {"text": AppLocalizations.of(context)!.holiday, "icon": Icons.beach_access},
      {"text": AppLocalizations.of(context)!.eating, "icon": Icons.restaurant},
    ];

    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
      height: context.height * 0.27,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.watch<ThemeProvider>().themeApp.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppLocalizations.of(context)!.welcome_back,
                    style: AppStyles.medium14White,
                  ),
                  CustomText(text: "John Safwat", style: AppStyles.bold24White),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: AppColors.whiteColor),
                      CustomText(
                        text: "Cairo , Egypt",
                        style: AppStyles.medium14White,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerWithIcon(
                    onTap: () {
                      context.themeProvider.themeApp == ThemeApp.LightTheme
                          ? context.themeProvider.changeTheme(ThemeApp.DarkTheme)
                          : context.themeProvider.changeTheme(ThemeApp.LightTheme);
                      SharedPref.preferences.setString(
                        PrefKeys.themeMode,
                        context.themeProvider.themeApp == "light" ? "light" : "dark",
                      );
                    },
                    content: Icon(
                      context.themeProvider.themeApp == ThemeApp.LightTheme
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: context.themeProvider.themeApp.primaryColor,
                    ),
                    containerColor: AppColors.whiteColor,
                  ),
                  SizedBox(width: context.width * 0.015),
                  ContainerWithIcon(
                    onTap: () {
                      context.localProvider.locale == "en"
                          ? context.localProvider.changeLocale("ar")
                          : context.localProvider.changeLocale("en");
                      SharedPref.preferences.setString(
                        PrefKeys.lang,
                        context.localProvider.locale == "en" ? "en" : "ar",
                      );
                    },
                    content: CustomText(
                      text: context.localProvider.locale == "en" ? "EN" : "عربى",
                      style: AppStyles.bold14Blue,
                    ),
                    containerColor: AppColors.whiteColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: context.height * 0.02),
          DefaultTabController(
            length: eventsList.length,
            child: TabBar(
              controller: controller,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              dividerColor: Colors.transparent,
              dividerHeight: 0,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              tabs: eventsList.map((event) {
                return EventTabItem(
                  text: event["text"],
                  isSelected: selectedIndex == eventsList.indexOf(event),
                  icon: event["icon"],
                  borderColor: selectedIndex == eventsList.indexOf(event)
                      ? (context.themeProvider.isDark() ? AppColors.whiteColor : AppColors.primaryLight)
                      : null,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
