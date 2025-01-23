import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final Color? color;
  const Texts({
    super.key,
    required this.text,
    this.textOverflow,
    this.decoration,
    this.textAlign,
    this.fontSize,
    this.fontWeight = FontWeight.w500,
    this.color,
    this.maxLines,
    this.softWrap,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: softWrap,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        decorationColor: color,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
