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

class LoginBodyView extends StatelessWidget {
   LoginBodyView({super.key});
  final TextEditingController emailcontroller =TextEditingController();
    final TextEditingController passwordcontroller =TextEditingController();
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
          
        
                 CustomTextField(
          controller: passwordcontroller,
          hintText: AppLocalizations.of(context)!.password,
          hintStyle: context.themeProvider.themeApp.textTheme.bodyMedium,
          enabledBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,
                              focusedBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,

          prefixIconColor: context.themeProvider.themeApp.iconTheme.color,
          suffixIconColor:context.themeProvider.themeApp.iconTheme.color,
          textColor : context.themeProvider.themeApp.iconTheme.color,
          prefixIcon: Icon(Icons.lock),
          showPasswordIcon: true,
          keyboardType: TextInputType.visiblePassword,
          validator:(value)=> Validators.isPassword(value),
          ),
        
        
          Align(
            alignment:Alignment.centerRight ,
            child: TextButton.icon(onPressed: (){
               context.pushNamed(AppRoutes.forgetpassword);
            },
             label:  CustomText(
             text:AppLocalizations.of(context)!.forget_password,
              style:TextStyle(color: AppColors.primaryLight),
             ), 
            ),
          ),
        
        
        
          CustomButton(
                  text: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    context.pushNamed(AppRoutes.home);
                  },
                  width: double.infinity,
                  height: context.height * 0.06,
                ),
        
                SizedBox(height:  context.height*0.03),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text:AppLocalizations.of(context)!.already_have_account,
                    style:context.themeProvider.themeApp.textTheme.bodyMedium,
                     ),
                     SizedBox(width: context.width*0.01,),
        
                    TextButton.icon(onPressed: (){
         
                    context.pushNamed(AppRoutes.regester);
                  
                      
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    
             label: CustomText(
             text: AppLocalizations.of(context)!.create_account,
              style:TextStyle(color: AppColors.primaryLight),
             ), 
            ), 
                  ],
                ),
        
                Row(
          children: [
            Expanded(
        child: Divider(
         
          thickness: 1.5 ,
          color: AppColors.primaryLight,
        ),
            ),
            Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomText(text: AppLocalizations.of(context)!.or,color: AppColors.greyColor,),
            ),
            Expanded(
        child: Divider(
             
          thickness: 1.5,
          color: AppColors.primaryLight,
        ),
            ),
          ],
        ),
        
        
                SizedBox(height:  context.height*0.03),
        
        
         CustomButton(
          backgroundColor: AppColors.whiteBgColor,
          icon: Image.asset(AppAssets.google,
          width: context.width*0.05,
            height: context.width*0.05,),
          textColor: AppColors.primaryLight,
          borderColor: AppColors.primaryLight,
                  text: AppLocalizations.of(context)!.login_with_google,
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