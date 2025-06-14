import 'package:flutter/material.dart';
import 'package:simple_otp/otp_box.dart';

class SimpleOTPTextField extends StatelessWidget {
  final int fieldCount;
  final String? otpValue;
  final bool obscureText;
  final Widget? error;
  final double spaceBetweenBoxes;
  final TextStyle textStyle;
  final Color? dotColor;
  final BoxDecoration Function(bool filled) boxDecoration;

  const SimpleOTPTextField({
    super.key,
    this.fieldCount = 4,
    this.otpValue,
    this.obscureText = false,
    this.error,
    this.spaceBetweenBoxes = 12.0,
    this.textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    this.dotColor,
    this.boxDecoration = defaultBoxDecoration,
  });

  String _extractValue(int index) {
    if ((otpValue?.length ?? 0) > index) {
      return obscureText ? '•' : otpValue![index];
    }
    return '•';
  }

  bool _isFilled(int index) {
    return (otpValue?.length ?? 0) > index;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final totalSpacing = (fieldCount - 1) * spaceBetweenBoxes;
    final availableWidth = screenWidth - totalSpacing;
    final size = (availableWidth / fieldCount) * 0.9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(fieldCount, (i) {
            return Padding(
              padding: EdgeInsets.only(
                right: i != fieldCount - 1 ? spaceBetweenBoxes : 0,
              ),
              child: OTPBox(
                size: size,
                value: _extractValue(i),
                filled: _isFilled(i),
                obscure: obscureText,
                textStyle: textStyle,
                dotColor: dotColor,
                decoration: boxDecoration(_isFilled(i)),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        error ?? const SizedBox.shrink(),
      ],
    );
  }

  static BoxDecoration defaultBoxDecoration(bool filled) {
    return BoxDecoration(
      border: Border.all(
        color: filled ? Colors.blue : Colors.grey,
        width: 1.5,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
