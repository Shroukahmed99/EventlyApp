import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/card_event_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LoveTap extends StatelessWidget {
   LoveTap({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.04),
        Padding(
          padding: const EdgeInsets.only(left: 16  , 
          right: 16,
          top: 16
          ),
          
          child: CustomTextField(
            controller: textController,
            hintText: AppLocalizations.of(context)!.search_event,
            hintStyle: AppStyles.bold14Primary,
            enabledBorderColor: AppColors.primaryLight,
                      focusedBorderColor: AppColors.primaryLight,
          
            prefixIconColor: AppColors.primaryLight,
            
            textColor : context.themeProvider.themeApp.iconTheme.color,
            prefixIcon: Icon(Icons.search),
            // keyboardType: TextInputType.text,
             
            ),
        ),

        SizedBox(height: context.height * 0.02),
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
