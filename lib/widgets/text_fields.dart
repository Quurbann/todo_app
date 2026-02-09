import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String labelName;
  final String hintText;
  final bool obscureText;
  final double? letterSpacing;
  final Color? hintColor;
  final Color? enabledBorderColor;

  const PrimaryTextField({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.obscureText,
    this.letterSpacing,
    this.hintColor,
    this.enabledBorderColor,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.87),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          cursorColor: Colors.white,
          obscureText: widget.obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.hintColor ?? const Color(0xff535353),
              letterSpacing: widget.letterSpacing,
            ),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: const Color(0xff1D1D1D),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff979797)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.enabledBorderColor ?? Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondaryTextField extends StatelessWidget {
  final String hintText;
  final bool autofocus;
  final TextEditingController? controller;

  const SecondaryTextField({
    super.key,
    required this.hintText,
    required this.autofocus,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff979797), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      cursorColor: Colors.white,
      autofocus: autofocus,
    );
  }
}
