import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required this.obSecureText,
      required this.controller,
      required this.hintText,
      this.validator})
      : super(key: key);

  final bool obSecureText;
  final TextEditingController controller;
  final String hintText;
  final String Function(String?)? validator;

  // Method to toggle obscure text
  void toggleObsecure() => _CustomTextFormFieldState()._toggleObsecure();

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obSecureText = false;

  // Method to toggle obscure text
  void _toggleObsecure() {
    setState(() {
      _obSecureText = !_obSecureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _obSecureText =
        widget.obSecureText; // Set initial state based on obSecureText prop
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Get.textTheme.titleSmall,
      controller: widget.controller,
      obscureText: widget.obSecureText ? _obSecureText : false,
      validator: (value) {
        if (value == null || value.isEmpty || value.trim() == '') {
          return '${widget.hintText} is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.obSecureText
            ? IconButton(
                onPressed: _toggleObsecure,
                icon: Icon(
                    _obSecureText ? Icons.visibility : Icons.visibility_off),
              )
            : null, // If it's not a password field, don't show suffixIcon
      ),
    );
  }
}
