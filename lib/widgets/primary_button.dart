import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;


  PrimaryButton({super.key, required this.text, required this.onPressed, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Color(0xff8687E7),
        shadowColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ??  Colors.white.withValues(alpha: 0.5),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}