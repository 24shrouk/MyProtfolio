import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.hint,
      this.onChange,
      this.obscurText = false,
      this.maxlines,
      required this.label});

  final String? hint;
  final bool obscurText;
  final Function(String)? onChange;
  final int? maxlines;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChange,
      maxLines: maxlines ?? 1,
      decoration: InputDecoration(
        label: label,
        labelStyle: const TextStyle(color: Color(0xffEEEEEE)),
        filled: true,
        fillColor: const Color(0xff393E46),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xff393E46),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white, //Color(0xff393E46),
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xffEEEEEE)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white, //Color(0xff393E46),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      ),
    );
  }
}
