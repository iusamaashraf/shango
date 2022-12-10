import 'package:flutter/material.dart';

class PrimaryField extends StatelessWidget {
  const PrimaryField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    this.isObscure = false,
    required this.validator,
    required this.hintText,
    required this.textInputType,
  });
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.06,

      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        keyboardType: textInputType,
        validator: validator,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey.shade400,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
