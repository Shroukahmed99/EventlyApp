import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/card_event_item.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/custom_app_bar_home.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.04),
        CustomAppBarHome(),
        // SizedBox(height: context.height * 0.02),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return CardEventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: context.height * 0.04);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
