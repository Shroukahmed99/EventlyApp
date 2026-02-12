import 'package:evently_app/feature/Auth/presentation/wigdets/regester_body_view.dart';
import 'package:flutter/material.dart';

class RegesterView extends StatelessWidget {
  const RegesterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:RegesterBodyView()),
    );
  }
}