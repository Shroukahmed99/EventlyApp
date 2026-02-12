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

class RegesterBodyView extends StatelessWidget {
   RegesterBodyView({super.key});
  final TextEditingController nameController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();
    final TextEditingController passwordController =TextEditingController();
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
          controller: nameController,
          hintText: AppLocalizations.of(context)!.name,
          hintStyle: context.themeProvider.themeApp.textTheme.bodyMedium,
          enabledBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,
                    focusedBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,

          prefixIconColor: context.themeProvider.themeApp.iconTheme.color,
          suffixIconColor:context.themeProvider.themeApp.iconTheme.color,
          textColor : context.themeProvider.themeApp.iconTheme.color,
          prefixIcon: Icon(Icons.person),
          keyboardType: TextInputType.name,
            validator:(value)=> Validators.isEmail(value),
          ),
        
          SizedBox(height:  context.height*0.03),
        
        CustomTextField(
          controller: emailController,
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
          controller: passwordController,
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
          SizedBox(height:  context.height*0.03),

           CustomTextField(
          controller: confirmPasswordController,
          hintText: AppLocalizations.of(context)!.reset_password,
          hintStyle: context.themeProvider.themeApp.textTheme.bodyMedium,
          enabledBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,
                              focusedBorderColor: context.themeProvider.themeApp.inputDecorationTheme.enabledBorder!.borderSide.color,

          prefixIconColor: context.themeProvider.themeApp.iconTheme.color,
          suffixIconColor:context.themeProvider.themeApp.iconTheme.color,
          textColor : context.themeProvider.themeApp.iconTheme.color,
          prefixIcon: Icon(Icons.lock),
          showPasswordIcon: true,
          keyboardType: TextInputType.visiblePassword,
          validator:(value)=> Validators.confirmPassword(value, passwordController.toString()),
          ),
        
        
         
        
        SizedBox(height:  context.height*0.03),
        
          CustomButton(
                  text: AppLocalizations.of(context)!.create_account,
                  onPressed: () {
                    context.pushNamed(AppRoutes.home);
                  },
                  width: double.infinity,
                  height: context.height * 0.06,
                ),
        
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text:AppLocalizations.of(context)!.dont_have_account,
                    style:context.themeProvider.themeApp.textTheme.bodyMedium,
                     ),
                     SizedBox(width: context.width*0.0,),
        
                    TextButton.icon(onPressed: (){
         
                    context.pushNamed(AppRoutes.login);
                  
                      
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    
             label: CustomText(
             text: AppLocalizations.of(context)!.login,
              style:TextStyle(color: AppColors.primaryLight),
             ), 
            ), 
                  ],
                ),
        
                      ],
        ),
      ),
    );
  }
}