import 'package:flutter/material.dart';

class OTPBox extends StatelessWidget {
  final double size;
  final String value;
  final bool filled;
  final bool obscure;
  final TextStyle textStyle;
  final Color? dotColor;
  final BoxDecoration decoration;

  const OTPBox({
    super.key,
    required this.size,
    required this.value,
    required this.filled,
    required this.obscure,
    required this.textStyle,
    required this.decoration,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDot = obscure && value == '•';

    return Container(
      width: size,
      height: size + 10,
      decoration: decoration,
      child: Center(
        child: Text(
          value,
          style: isDot && filled ? textStyle.copyWith(color: dotColor ?? Colors.blue) : textStyle,
        ),
      ),
    );
  }
}
