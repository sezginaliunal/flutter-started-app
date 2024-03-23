import 'package:flutter/material.dart';

class CustomFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  const CustomFormWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
