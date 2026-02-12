import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCreateDropDown<T> extends StatelessWidget {
  const CustomCreateDropDown({
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.value,
    this.height = 58,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
    this.itemToWidget, // <-- هنا
    super.key,
  });

  final String hintText;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final Widget Function(T item)? itemToWidget; // <-- Function

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: items.isNotEmpty ? value : null,
          hint: Text(
            hintText,
            style: TextStyle(
              fontSize: 14.sp,
              color: textColor.withOpacity(0.6),
            ),
          ),
          icon: Icon(Icons.expand_more, color: iconColor),
          dropdownColor: backgroundColor,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: itemToWidget != null
                  ? itemToWidget!(item) // استخدم الـ Builder لو متوفر
                  : Text(
                      item.toString(), // افتراضي
                      style: TextStyle(fontSize: 14.sp, color: textColor),
                    ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
