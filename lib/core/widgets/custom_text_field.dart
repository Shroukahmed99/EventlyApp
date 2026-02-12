import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColor,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.textColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.prefixIconColor,
    this.suffixIconColor,
    this.showPasswordIcon = false, 
  });

  final TextEditingController controller;
  final bool filled;
  final bool obscureText;
  final bool readOnly;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final bool overrideValidator;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final Color? textColor;
  final Color? fillColor;

  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? focusedErrorBorderColor;

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  final bool showPasswordIcon; 
  

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      cursorColor: widget.textColor,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: widget.textColor,
      ),
      validator: widget.overrideValidator ? null : widget.validator,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.enabledBorderColor ?? Colors.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? Colors.grey,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.errorBorderColor ?? Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: widget.focusedErrorBorderColor ?? Colors.red,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
                data: IconThemeData(color: widget.prefixIconColor ?? Colors.grey),
                child: widget.prefixIcon!,
              )
            : null,
        suffixIcon: widget.showPasswordIcon
            ? IconButton(
                onPressed: _togglePassword,
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: widget.suffixIconColor ?? Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
