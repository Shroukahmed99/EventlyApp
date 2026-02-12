import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/container_with_icon.dart';
import 'package:flutter/material.dart';

class CardEventItem extends StatelessWidget {
  const CardEventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: context.height*0.35,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        
        
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,color: AppColors.primaryLight,
        ),
        // image: DecorationImage(image: AssetImage(AppAssets.birthday ,
        
        // ),
        //   fit: BoxFit.fill,
        // ),

      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
          //  clipBehavior: Clip.hardEdge,
            child: Image.asset(AppAssets.eating ,fit: BoxFit.fill,
             width: double.infinity,
             height: double.infinity,
             ),
          ),
Positioned(
  top: context.height*0.02,
  left: context.width*0.035,
  // bottom: 0,
  child: ContainerWithIcon(content: Column(
    mainAxisSize: MainAxisSize.min,
    
    children: [
    CustomText(text: "21" ,style: AppStyles.bold16Primary,),
    CustomText(text: "Nov" ,style: AppStyles.bold16Primary,),
  ],
  ),
             onTap: (){},
              containerColor: AppColors.whiteColor
              , width: context.width * 0.14,
  height: context.width * 0.15,
              ),
),

Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 12),
    child: ContainerWithIcon(content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: " This is a Birthday Party " ,style: AppStyles.bold14Black, ),
         Icon(
                        Icons.favorite_border,
                        color: AppColors.primaryLight,
                      ),

      ],

    ),
                 onTap: (){},
                  containerColor: AppColors.whiteColor
                  , width: double.infinity,
      height: context.width * 0.12,
                  ),
  ),
),
        ],
      ),
    );
  }
}