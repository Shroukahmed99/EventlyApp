import 'package:evently_app/config/routes/app_routes.dart';
import 'package:evently_app/config/themes/theme%20provider/theme_provider.dart';
import 'package:evently_app/config/themes/theme%20provider/translation_provider.dart';
import 'package:evently_app/config/themes/themes.dart';
import 'package:evently_app/core/cache/shared_pref/pref_keys.dart';
import 'package:evently_app/core/cache/shared_pref/shared_pref.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.preferences.instantiatePreferences();
  String lang = SharedPref.preferences.getString(PrefKeys.lang)?? "en";
    String themeMode = SharedPref.preferences.getString(PrefKeys.themeMode)?? "light";
    
      
      bool seenOnboarding =
      SharedPref.preferences.getBoolean(PrefKeys.seenOnboarding) ?? false;


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TranslationProvider()..changeLocale(lang)),
        ChangeNotifierProvider(create: (context) => ThemeProvider()..changeTheme(
          themeMode=="light" ?ThemeApp.LightTheme:ThemeApp.DarkTheme)),
      ],
      child:  MyApp(seenOnboarding: seenOnboarding, ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.seenOnboarding});
  
 final bool seenOnboarding;
  @override
  Widget build(BuildContext context) {
    var themeApp = Provider.of<ThemeProvider>(context);
    var LocaleApp = Provider.of<TranslationProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Evently App',
          debugShowCheckedModeBanner: false,
          theme: themeApp.themeApp,
          locale: Locale(LocaleApp.locale.toLowerCase()),
          supportedLocales: const [Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: seenOnboarding ?AppRoutes.home : AppRoutes.getStarted ,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
