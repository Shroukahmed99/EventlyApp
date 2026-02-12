import 'package:evently_app/feature/Auth/presentation/wigdets/login_body_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginBodyView()),
    );
  }
}