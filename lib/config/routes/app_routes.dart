
import 'package:evently_app/config/routes/base_routes.dart';
import 'package:evently_app/feature/Auth/presentation/views/forget_password_view.dart';
import 'package:evently_app/feature/Auth/presentation/views/login_view.dart';
import 'package:evently_app/feature/Auth/presentation/views/regester_view.dart';
import 'package:evently_app/feature/Home/presentation/views/add_event_view.dart';
import 'package:evently_app/feature/Home/presentation/views/home_view.dart';
import 'package:evently_app/feature/onboarding/presentation/views/get_started_view.dart';
import 'package:evently_app/feature/onboarding/presentation/views/on_boarding_view.dart';

import 'package:flutter/material.dart';


class AppRoutes {
  static const getStarted = '/getStarted';
  static const onBoarding = '/onBoarding';
  static const home = '/home';
  static const login = '/login';
  static const regester = '/regester';
  static const forgetpassword = '/forgetpassword';
  static const addEvent = '/addEvent';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    
      case getStarted:
        return BaseRoute(page: GetStartedView());

      case onBoarding:
        return BaseRoute(page: OnBoardingView());

      case home:
        return BaseRoute(page: HomeView());
          case login:
        return BaseRoute(page: LoginView());
        case regester:
        return BaseRoute(page: RegesterView());

case forgetpassword:
        return BaseRoute(page: ForgetPasswordView());

        case addEvent:
        return BaseRoute(page: AddEventView());


      default:
        return BaseRoute(
          page: const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
