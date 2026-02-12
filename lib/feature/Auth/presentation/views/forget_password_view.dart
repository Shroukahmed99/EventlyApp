import 'package:evently_app/feature/Auth/presentation/wigdets/forget_password_body_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ForgetPasswordBodyView()),
    );
  }
}