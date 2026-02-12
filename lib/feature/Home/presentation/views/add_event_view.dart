import 'package:evently_app/config/themes/theme%20provider/theme_provider.dart';
import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_text.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/container_with_icon.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/event_tab_item.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/event_picker_tile.dart';
import 'package:evently_app/feature/Home/presentation/views/widgets/pick_location_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AddEventView extends StatefulWidget {
  AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
    TextEditingController textController = TextEditingController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
   final List<Map<String, dynamic>> eventsList = [
  {"text": AppLocalizations.of(context)!.sport, "icon": Icons.sports_soccer},
  {"text": AppLocalizations.of(context)!.birthday, "icon": Icons.cake},
  {"text": AppLocalizations.of(context)!.meeting, "icon": Icons.people},
  {"text": AppLocalizations.of(context)!.gaming, "icon": Icons.videogame_asset},
  {"text": AppLocalizations.of(context)!.workshop, "icon": Icons.handyman},
  {"text": AppLocalizations.of(context)!.book_club, "icon": Icons.menu_book},
  {"text": AppLocalizations.of(context)!.exhibition, "icon": Icons.art_track},
  {"text": AppLocalizations.of(context)!.holiday, "icon": Icons.beach_access},
  {"text": AppLocalizations.of(context)!.eating, "icon": Icons.restaurant},
];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
          color: AppColors.primaryLight,
        ),

        title: CustomText(
          text: "Create Event",
          textAlign: TextAlign.center,
          style: AppStyles.medium16Primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                
                clipBehavior: Clip.antiAlias,
                child: Image.asset(AppAssets.eating),
              ),
               SizedBox(height: context.height * 0.02,) ,
             SizedBox(
  height: context.height * 0.06,
  width: double.infinity,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: eventsList.length,
    separatorBuilder: (context, index) {
      return SizedBox(width: context.width * 0.015);
    },
    itemBuilder: (context, index) {
      final event = eventsList[index];
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: EventTabItem(
          text: event["text"],
          isSelected: selectedIndex == index,
          borderColor: selectedIndex == index
              ? (context.themeProvider.isDark()
                  ? AppColors.whiteColor
                  : AppColors.primaryLight)
              : null,
          icon: event["icon"], // هنا حطينا الأيقونة
        ),
      );
    },
  ),
),
                 SizedBox(height:  context.height*0.03),
                 // title

                 CustomText(text: AppLocalizations.of(context)!.title, 
                 style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height:  context.height*0.02),
          CustomTextField(
              controller: textController,
              hintText: AppLocalizations.of(context)!.event_title,
              hintStyle: Theme.of(context).textTheme.headlineLarge,
              enabledBorderColor: context.themeProvider.isDark()? 
              AppColors.primaryLight
             : AppColors.greyColor,
            
              prefixIconColor: AppColors.primaryLight,
              
              textColor : context.themeProvider.themeApp.iconTheme.color,
              prefixIcon: Icon(Icons.edit_square ,
              color: context.themeProvider.isDark()? 
              AppColors.whiteColor
              :AppColors.blackColor,
              ),
             
               
              ),
          
          //des
          
            SizedBox(height:  context.height*0.03),
            CustomText(text: AppLocalizations.of(context)!.description,
             style:Theme.of(context).textTheme.headlineLarge),
            SizedBox(height:  context.height*0.02),
                   CustomTextField(
              controller: textController,
              hintText: AppLocalizations.of(context)!.event_description,
              hintStyle: Theme.of(context).textTheme.headlineLarge,
              enabledBorderColor: context.themeProvider.isDark()? 
              AppColors.primaryLight
              :AppColors.greyColor,
            maxLines: 4,
           
              
              textColor : context.themeProvider.themeApp.iconTheme.color,
             
               
              ),
          SizedBox(height:  context.height*0.01),

          //date

          EventPickerTile(
  icon: Icons.calendar_today,
  title: AppLocalizations.of(context)!.event_date,
  actionText: AppLocalizations.of(context)!.choose_date,
  onTap: () {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
  },
),
//  SizedBox(height:  context.height*0.01),

// time

 EventPickerTile(
  icon: Icons.access_time,
  title: AppLocalizations.of(context)!.event_time,
  actionText: AppLocalizations.of(context)!.choose_time,
  onTap: () async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // if (pickedTime != null) {
    //   // هنا ممكن تعملي حاجة بالوقت المختار
    //   print("Selected time: ${pickedTime.format(context)}");
    // }
  },
),
 
PickLocationWidget(),




 SizedBox(height:  context.height*0.03),


           CustomButton(
                  text: AppLocalizations.of(context)!.add_event,
                  onPressed: () {
                    // context.pushNamed(AppRoutes.home);
                  },
                  width: double.infinity,
                  height: context.height * 0.06,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
