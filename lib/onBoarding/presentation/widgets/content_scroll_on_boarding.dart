import 'package:evently_app/core/constants/app_styles.dart';
import 'package:evently_app/core/utils/extensions.dart';
import 'package:evently_app/core/utils/themes.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ContentScrollOnBoarding extends StatelessWidget {
  const ContentScrollOnBoarding({super.key, required this.image, required this.title, required this.subTitle, });
 final String image;
 final String title;
 final String subTitle;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: context.height*0.388,
          child: Image.asset(image,fit: BoxFit.fill,),),
         SizedBox(height: context.height*.03,),
        CustomText(text: title ,style: AppStyles.bold20Primary),
         SizedBox(height: context.height*.03,),
        CustomText(text: subTitle,style:Theme.of(context).textTheme.headlineLarge ),
      ],
    );
  }
}