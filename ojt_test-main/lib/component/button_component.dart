import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final double width;
  final double height;
  final Color backgroundColor;

  const ButtonComponent({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
  });

//All Delete 버튼 위젯
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // color: backgroundColor,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: backgroundColor,
          ),
          borderRadius: BorderRadius.circular(height * 0.5)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
