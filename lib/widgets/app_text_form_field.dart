import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final String? icon;
  final Color? hintColor;
  final Color? textColor;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;

  const AppTextFormField({
    Key? key,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.keyboardType,
    this.textAlign,
    this.hintColor,
    this.maxLines,
    this.minLines,
    this.icon,
    this.fillColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorWidth: 1,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: 14,
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintColor ?? Colors.black45,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 193, 193, 193),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 32, 35, 50),
          ),
        ),
      ),
    );
  }
}
