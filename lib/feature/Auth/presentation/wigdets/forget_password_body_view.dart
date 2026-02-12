import 'package:evently_app/config/routes/app_routes.dart';
import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/helper/validators.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBodyView extends StatelessWidget {
   ForgetPasswordBodyView({super.key});
  final TextEditingController emailcontroller =TextEditingController();
    final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
               SizedBox(height:  context.height*0.03),
         Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppAssets.logoColumn,
                      height: context.height * 0.2,
                      width: context.width * 0.5,
                    ),),
        
                     SizedBox(height:  context.height*0.05),
                     
        CustomTextField(
          controller: emailcontroller,
          hintText: AppLocalizations.of(context)!.email,
          hintStyle: context.themeProvider.themeApp.textTheme.bodyMedium,
          enabledBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,
                    focusedBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,

          prefixIconColor: context.themeProvider.themeApp.iconTheme.color,
          suffixIconColor:context.themeProvider.themeApp.iconTheme.color,
          textColor : context.themeProvider.themeApp.iconTheme.color,
          prefixIcon: Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
            validator:(value)=> Validators.isEmail(value),
          ),
        
                              SizedBox(height:  context.height*0.03),

          CustomButton(
                  text: AppLocalizations.of(context)!.reset_password,
                  onPressed: () {
                    context.pushNamed(AppRoutes.home);
                  },
                  width: double.infinity,
                  height: context.height * 0.06,
                ),
        
   
                      ],
        ),
      ),
    );
  }
}