import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final List<Color> gradientColors;
  final Color? backgroundColor;
  final double height;
  final double? width;
  final TextStyle? textStyle;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 30.0,
    this.gradientColors = const [Color(0xFF3649C3), Color(0xFF283690),Color(0xFF1A235D)
    ],
    this.backgroundColor,
    this.height = 50,
    this.width,
    this.textStyle,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: backgroundColor != null
              ? null
              : LinearGradient(colors: gradientColors),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
