import 'package:flutter/material.dart';
import 'package:taskone/Common/Utils/color.dart';

class Button extends StatelessWidget {
  final VoidCallback? onpressed;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final String text;
  final TextStyle? style;
  const Button({
    super.key,
    required this.onpressed,
    this.height = 50,
    this.width = 200,
    this.textColor = AppColors.white,
    this.color = AppColors.primaryColor,
    this.borderColor = Colors.transparent,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
