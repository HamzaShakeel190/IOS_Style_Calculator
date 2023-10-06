import 'package:flutter/material.dart';
import 'colors.dart';

class Buttons extends StatelessWidget {
  final Color backgroundColor;
  final String txt;
  final Color txtColor;
  final double size;
  final EdgeInsetsGeometry margin;
  final FontWeight fontWeight;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPress;

  const Buttons({
    super.key,
    this.backgroundColor = buttonColorDarkGrey,
    this.txt = "",
    this.txtColor = textColorWhite,
    this.size = 25,
    this.margin = const EdgeInsets.all(8.7),
    this.fontWeight = FontWeight.w400,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(5),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: margin,
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: Text(
              txt,
              style: TextStyle(
                fontSize: size,
                color: txtColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextStyle extends StatelessWidget {
  final String txt;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const CustomTextStyle(
      {super.key,
      this.txt = "",
      this.color = textColorBlack,
      this.fontSize = 80,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
