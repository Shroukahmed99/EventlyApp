
import 'package:evently_app/Home/presentation/views/home_view.dart';
import 'package:evently_app/core/utils/themes.dart';
import 'package:evently_app/onBoarding/presentation/on_boarding_view.dart';
import 'package:evently_app/onBoarding/presentation/widgets/get_started_view.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:evently_app/provider/translation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TranslationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   var themeApp =Provider.of<ThemeProvider>(context);
    var LocaleApp =Provider.of<TranslationProvider>(context);
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
      initialRoute: GetStartedView.routeName,
      routes: {
        GetStartedView.routeName: (context) => const GetStartedView(),
      OnBoardingView.routeName: (context) =>  OnBoardingView(),
      HomeView.routeName: (context) =>  HomeView(),
      
      
      },
    );
  }
}
