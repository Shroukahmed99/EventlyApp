import 'package:evently_app/core/extentions/extensions.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class EventPickerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const EventPickerTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.actionText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: 
        context.themeProvider.isDark()?AppColors.whiteColor :
        AppColors.blackColor ,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      trailing: TextButton(
        onPressed: onTap,
        child: Text(
          actionText,
          style: TextStyle(color: AppColors.primaryLight),
        ),
      ),
      onTap: onTap,
    );
  }
}





