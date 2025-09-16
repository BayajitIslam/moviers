import 'package:flutter/widgets.dart';
import 'package:moviers/utils/app_colors.dart';

class CustomeText extends StatelessWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final double lineHeight;

  const CustomeText({
    super.key,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontWeight = FontWeight.w700,
    this.color = AppColors.primaryText,
    required this.text,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.fontSize = 16,
    this.lineHeight = 1.4
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          fontFamily: "Helvetica",
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: lineHeight,
          decoration: decoration,
        ),
      ),
    );
  }
}
