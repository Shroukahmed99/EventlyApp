import 'package:evently_app/core/extentions/extensions.dart';
import 'package:flutter/material.dart';

class ContainerWithIcon extends StatelessWidget {
  final Widget content;
  final VoidCallback onTap;
  final Color containerColor;
  final double? width;
  final double? height;

  const ContainerWithIcon({
    super.key,
    required this.content,
    required this.onTap,
    required this.containerColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double containerWidth =
        width ?? context.width * 0.13;
    final double containerHeight =
        height ?? context.height * 0.06;

    return GestureDetector(
      
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: containerWidth,
        height: containerHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // border: Border.all(
          //   width:2,color: context.themeProvider.themeApp.primaryColor
          // ),
          color: containerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: content,
      ),
    );
  }
}
