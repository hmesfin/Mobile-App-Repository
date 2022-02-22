import 'package:flutter/material.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double width;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final EdgeInsetsGeometry margin, padding;
  final String fontFamily;
  final TextAlign textAlign;
  final AlignmentGeometry alignment;
  final int maxLines;
  final TextOverflow overflow;

  const CustomText({
    Key key,
    this.text,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.fontFamily,
    this.alignment,
    this.margin,
    this.padding,
    this.width,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      margin: margin ?? null,
      padding: padding ?? null,
      alignment: alignment ?? null,
      child: Text(text ?? "",
          maxLines: maxLines ?? null,
          //overflow: overflow ?? TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: fontFamily ?? 'Roboto',
              color: color ?? CustomColors.black1,
              fontWeight: fontWeight ?? FontStyles.semiBoldFontWeight500,
              fontSize: fontSize ?? FontStyles.size),
          textAlign: textAlign ?? TextAlign.center),
    );
  }
}
